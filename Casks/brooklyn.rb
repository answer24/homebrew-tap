cask "brooklyn" do
  version "2.1.3"
  sha256 "6ed5793a50c18c6e90093e2a738eb8abcb7511ede03a4f958aa3eba5567ca0e5"

  url "https://github.com/answer24/Brooklyn/releases/download/v#{version}/Brooklyn.saver.zip"
  name "Brooklyn"
  desc "macOS screen saver based on Apple's Brooklyn event animations (bug-fix fork)"
  homepage "https://github.com/answer24/Brooklyn"

  screen_saver "Brooklyn.saver"

  zap trash: "~/Library/Preferences/ByHost/oedrommcarrasco.brooklyn.*.plist"
end
