cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.7"
  sha256 arm:   "59a6195f1175a330f69a608c21bd1574869847a64c4a4222c44cad0a4edb6325",
         intel: "52af002facc10fdc9c77ab3bd83efa0f0689f80bef4faaef2764b1af30034567"

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
