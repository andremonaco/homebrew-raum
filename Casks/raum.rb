cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.23"
  sha256 arm:   "ece0f8dbe613d73f1e267f2451597f1c086988b959baa068742410e039ee324a",
         intel: "1237f99d80ca8bf4e98246f70b40d5789279a92ae52d1c8047438878f9586110"

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

  # Homebrew only unlinks the artifacts recorded in the *installed* cask's
  # receipt, and the `binary` stanza above only landed in 0.1.11. Receipts
  # written before that — and receipts that never got refreshed across an
  # upgrade; we have seen a 0.1.14 install still carrying a 0.1.3 receipt —
  # list only `app` + `zap`, so uninstalling the old version leaves
  # `bin/raum` behind. Linking the binary then finds an occupied target,
  # raises "It seems there is already a Binary at '<prefix>/bin/raum'", and
  # the whole upgrade rolls back: the user stays pinned to their installed
  # version until they delete the symlink by hand.
  #
  # Drop the orphan first (preflight steps run before any artifact is
  # installed, whatever their position in this file). Only a symlink
  # pointing into a raum.app bundle is touched — exactly the link we, or a
  # manual DMG install, created — and the `binary` stanza recreates it
  # immediately. Without `sudo:` the removal is best-effort: an unwritable
  # prefix leaves the link in place and linking raises the error above,
  # where `brew upgrade --cask --force raum` still gets through.
  preflight_steps do
    remove "bin/raum", base: :homebrew_prefix,
           symlink_target_contains: "raum.app/Contents/Resources/raum-cli"
  end

  zap trash: [
    "~/Library/Application Support/de.raum.desktop",
    "~/Library/Caches/de.raum.desktop",
    "~/Library/Preferences/de.raum.desktop.plist",
  ]
end
