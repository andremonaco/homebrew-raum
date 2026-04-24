cask "raum" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "77e846d9ce7a22c5793844f7e90f86f8492a2e12fa441171693b08a7252bec30",
         intel: "2c513574962d9942b6ad606cdcd54abd85f858ae05ce3b876fb01e8f0f4606eb"

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
