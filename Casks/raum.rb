cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.11"
  sha256 arm:   "ffd8b8b9e33d0736b91aca86adda0f824a6a269e94f11df47f557c7a0bd29ec5",
         intel: "cf8aa3d3323b822cc9bbe5ae0db9801043d7a5d85c3a47c1ec40ea81683b7c49"

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
