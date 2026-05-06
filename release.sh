#!/usr/bin/env bash
# Update a homebrew tap cask after releasing a new version.
#
# Usage:
#   ./release.sh <cask-name> <version> <zip-path> <github-repo>
#
# Example:
#   ./release.sh brooklyn 2.2.0 /path/to/Brooklyn.saver.zip barrybarrywu/Brooklyn

set -euo pipefail

CASK_NAME="${1:-}"
VERSION="${2:-}"
ZIP_PATH="${3:-}"
GITHUB_REPO="${4:-}"

if [[ -z "$CASK_NAME" || -z "$VERSION" || -z "$ZIP_PATH" || -z "$GITHUB_REPO" ]]; then
    echo "Usage: $0 <cask-name> <version> <zip-path> <github-repo>"
    echo "Example: $0 brooklyn 2.2.0 ./Brooklyn.saver.zip barrybarrywu/Brooklyn"
    exit 1
fi

TAP_DIR="$(cd "$(dirname "$0")" && pwd)"
CASK_FILE="$TAP_DIR/Casks/${CASK_NAME}.rb"
TAG="v${VERSION}"
ZIP_NAME="$(basename "$ZIP_PATH")"

[[ -f "$ZIP_PATH" ]]  || { echo "Error: zip not found: $ZIP_PATH"; exit 1; }
[[ -f "$CASK_FILE" ]] || { echo "Error: cask not found: $CASK_FILE"; exit 1; }

# Verify the zip has the .saver bundle at root (not nested inside a subdirectory)
if ! unzip -l "$ZIP_PATH" | awk '{print $4}' | grep -qE '^[^/]+\.saver/$'; then
    echo "Error: zip must contain a .saver bundle at root level (not nested in a subdirectory)"
    echo "  Pack with: cd <build-dir> && zip -r /tmp/Name.saver.zip Name.saver"
    exit 1
fi

echo "→ Calculating SHA256..."
SHA256=$(shasum -a 256 "$ZIP_PATH" | awk '{print $1}')
echo "  $SHA256"

echo "→ Checking GitHub release $TAG..."
if ! gh release view "$TAG" --repo "$GITHUB_REPO" &>/dev/null; then
    echo "  Release not found, creating..."
    gh release create "$TAG" \
        --repo "$GITHUB_REPO" \
        --title "$TAG" \
        --generate-notes
fi

echo "→ Uploading $ZIP_NAME to $GITHUB_REPO $TAG..."
gh release upload "$TAG" "$ZIP_PATH" \
    --repo "$GITHUB_REPO" \
    --clobber

echo "→ Updating $CASK_FILE..."
sed -i '' "s/version \".*\"/version \"$VERSION\"/" "$CASK_FILE"
sed -i '' "s/sha256 \".*\"/sha256 \"$SHA256\"/" "$CASK_FILE"

echo "→ Committing and pushing tap..."
cd "$TAP_DIR"
git add "Casks/${CASK_NAME}.rb"
git commit -m "bump ${CASK_NAME} to ${VERSION}"
git push

echo ""
echo "Done. Install / upgrade with:"
echo "  brew install --cask barrybarrywu/tap/${CASK_NAME}"
echo "  brew upgrade --cask barrybarrywu/tap/${CASK_NAME}"
