cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.9"
  sha256 arm:   "caaa65019fa2170a64bd4119a75cac003f705ddf9e12923a162437e58ee0ccf7",
         intel: "500759e419af284ad703b34f084ca68907e448018974a9f31e8bc0f57bc208fb"

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
