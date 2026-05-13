cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.8"
  sha256 arm:   "33f0f01fefb43fa219bb4b230dabc3a4f41dc9b1ba80dbf53932311cb801d6de",
         intel: "2dfcd9e5d41f0fb620419ea049ac883c5ae47cec9bd6ad150c0bcbf44959901f"

  url "https://github.com/andremonaco/raum/releases/download/v#{version}/raum_#{version}_#{arch}.dmg"
  name "raum"
  desc "Lightning-fast, recoverable terminals for AI agent harnesses"
  homepage "https://github.com/andremonaco/raum"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"
  depends_on formula: "tmux"

  app "raum.app"

  zap trash: [
    "~/Library/Application Support/de.raum.desktop",
    "~/Library/Caches/de.raum.desktop",
    "~/Library/Preferences/de.raum.desktop.plist",
  ]
end
