cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.13"
  sha256 arm:   "e7aa713a7f6c87e52ab6c4506966569e05ac3845ae187da2cf333ae5fcf5f890",
         intel: "a160875aee40a137723ebd130a7fdd5764ba357051413ddfb123773d769fb2d7"

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
  # `raum <dir>` opens a directory as a project from the terminal. The wrapper
  # (bundled at Contents/Resources/raum-cli) launches the GUI detached so the
  # shell returns immediately.
  binary "#{appdir}/raum.app/Contents/Resources/raum-cli", target: "raum"

  zap trash: [
    "~/Library/Application Support/de.raum.desktop",
    "~/Library/Caches/de.raum.desktop",
    "~/Library/Preferences/de.raum.desktop.plist",
  ]
end
