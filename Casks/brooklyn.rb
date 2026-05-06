cask "brooklyn" do
  version "2.1.3"
  sha256 "5df679dbc0540c45874aef949572ee3da2d636798894249b0c03343db64ba490"

  url "https://github.com/answer24/Brooklyn/releases/download/v#{version}/Brooklyn.saver.zip"
  name "Brooklyn"
  desc "macOS screen saver based on Apple's Brooklyn event animations (bug-fix fork)"
  homepage "https://github.com/answer24/Brooklyn"

  screen_saver "Brooklyn.saver"

  zap trash: "~/Library/Preferences/ByHost/oedrommcarrasco.brooklyn.*.plist"
end
