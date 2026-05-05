cask "brooklyn" do
  version "2.1.1"
  sha256 "3e8273402e1a4f154f22c536bdaac30203d4370358fd1ed1a3b9268c80dc3a98"

  url "https://github.com/answer24/Brooklyn/releases/download/v#{version}/Brooklyn.saver.zip"
  name "Brooklyn"
  desc "macOS screen saver based on Apple's Brooklyn event animations (bug-fix fork)"
  homepage "https://github.com/answer24/Brooklyn"

  screen_saver "Brooklyn.saver"

  zap trash: "~/Library/Preferences/ByHost/oedrommcarrasco.brooklyn.*.plist"
end
