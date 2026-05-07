cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "844ad80b40fb54195ca4d8befeb790430b112db5b07d47f5e0c4d947d8009b50",
         intel: "0f94432c7114c2a3326c6b1b95e961e409c9694ec56b95d1114f50bd2dda281a"

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
