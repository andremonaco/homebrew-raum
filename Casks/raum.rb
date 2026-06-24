cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.10"
  sha256 arm:   "312ce6a2aad21ed954a7a9e082a983fefd11ae51f06f356a27ad341eb392ad01",
         intel: "4a88f39ef54bffce524cf5fa2dd458c35a41887ab4eaea813efd34d15e7b5080"

  url "https://github.com/andremonaco/raum/releases/download/v#{version}/raum_#{version}_#{arch}.dmg"
  name "raum"
  desc "Lightning-fast, recoverable terminals for AI agent harnesses"
  homepage "https://github.com/andremonaco/raum"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur
  depends_on formula: "tmux"

  app "raum.app"

  zap trash: [
    "~/Library/Application Support/de.raum.desktop",
    "~/Library/Caches/de.raum.desktop",
    "~/Library/Preferences/de.raum.desktop.plist",
  ]
end
