cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "34d520bf4a3479ca2d30ff6c50d8712de2eccc1f0aa5fa8cb643d90f946c2521",
         intel: "717b1fece68157be733d952a8b8abd5480154cdd7419b98fa9841975472f5e3d"

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
    "~/Library/Preferences/de.raum.desktop.plist",
    "~/Library/Caches/de.raum.desktop",
  ]
end
