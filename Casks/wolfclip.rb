cask "wolfclip" do
  version "1.0.0"
  sha256 "f737f358bffa4f1225e91084331cae3c45104bfb08e2cbf4f814b48997b76318"

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
