cask "wolfclip" do
  version "1.0.1"
  sha256 "c503e56572d0c8934baa268ed4bd66d1d5eb1e64fa8f5997d1fa213de66f5e9c"

  url "https://github.com/RakushkaTOP/wolfclip/releases/download/v#{version}/WolfClip-macOS.zip"
  name "WolfClip"
  desc "Clipboard history in a Win+V style panel"
  homepage "https://github.com/RakushkaTOP/wolfclip"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "WolfClip.app"

  # Not notarized by Apple (ad-hoc signed), so drop the download quarantine;
  # otherwise Gatekeeper refuses to open the app.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/WolfClip.app"]
  end

  uninstall quit: "one.wolfteam.wolfclip"

  zap trash: [
    "~/Library/Application Support/WolfClip",
    "~/Library/Preferences/one.wolfteam.wolfclip.plist",
  ]
end
