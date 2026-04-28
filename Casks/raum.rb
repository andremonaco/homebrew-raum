cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "7d5410bb4fc6de398a489ef95953df6becb0e189249164e7f09833233309e7b3",
         intel: "572cfb1a194fbcd29a4ddadba163d06110324bea142e511d1f1a451636d70e0f"

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
