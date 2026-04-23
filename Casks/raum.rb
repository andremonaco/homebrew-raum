cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "dffde29ae86913deac8efb7c2474f02b738ee0cf6ce163bf1b61e3bb12829346",
         intel: "641865c94a99f22527f2530dce3de44757f57280f6a81919e7ea377d0f231a4b"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-d", "-r", "com.apple.quarantine", "#{appdir}/raum.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/de.raum.desktop",
    "~/Library/Caches/de.raum.desktop",
    "~/Library/Preferences/de.raum.desktop.plist",
  ]

  caveats <<~EOS
    raum is ad-hoc signed, not notarized by Apple. This cask strips the
    Gatekeeper quarantine flag on install so the app launches directly from
    Finder. The bundle is built from source at
    https://github.com/andremonaco/raum.
  EOS
end
