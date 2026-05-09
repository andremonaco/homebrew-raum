cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.6"
  sha256 arm:   "cc859407e09bf6836db5e26798caa707739a68374a5501cc2173085895b21759",
         intel: "d5dbde952550d64c9c70a2e2ed6f75b6e3539cfcd97904e591f8127ff496d569"

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
