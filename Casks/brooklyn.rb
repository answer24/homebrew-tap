cask "brooklyn" do
  version "2.1.4"
  sha256 "1d2555c50b3e3adc1d8489419c9c52c1294728ffd9cf243faf946d7781a38d7e"

  url "https://github.com/barrybarrywu/Brooklyn/releases/download/v#{version}/Brooklyn.saver.zip"
  name "Brooklyn"
  desc "macOS screen saver based on Apple's Brooklyn event animations (bug-fix fork)"
  homepage "https://github.com/barrybarrywu/Brooklyn"

  screen_saver "Brooklyn.saver"

  zap trash: "~/Library/Preferences/ByHost/oedrommcarrasco.brooklyn.*.plist"
end
