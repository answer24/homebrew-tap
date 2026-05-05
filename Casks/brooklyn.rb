cask "brooklyn" do
  version "2.1.1"
  sha256 "f60f39df6d2379f6e89dcc3c79952523a12762070fa794597292bfc2ed40a1b7"

  url "https://github.com/answer24/Brooklyn/releases/download/v#{version}/Brooklyn.saver.zip"
  name "Brooklyn"
  desc "macOS screen saver based on Apple's Brooklyn event animations (bug-fix fork)"
  homepage "https://github.com/answer24/Brooklyn"

  screen_saver "Brooklyn.saver"

  zap trash: "~/Library/Preferences/ByHost/oedrommcarrasco.brooklyn.*.plist"
end
