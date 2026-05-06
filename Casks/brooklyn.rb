cask "brooklyn" do
  version "2.1.2"
  sha256 "8978bcb7a79a2fec06bdf1d15eab42f1d5f625757f53c028e9f1295c61653283"

  url "https://github.com/answer24/Brooklyn/releases/download/v#{version}/Brooklyn.saver.zip"
  name "Brooklyn"
  desc "macOS screen saver based on Apple's Brooklyn event animations (bug-fix fork)"
  homepage "https://github.com/answer24/Brooklyn"

  screen_saver "Brooklyn.saver"

  zap trash: "~/Library/Preferences/ByHost/oedrommcarrasco.brooklyn.*.plist"
end
