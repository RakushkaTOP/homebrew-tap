# RakushkaTOP Homebrew tap

```bash
brew install --cask rakushkatop/tap/wolfclip
```

| Cask | What it is |
|---|---|
| [`wolfclip`](https://github.com/RakushkaTOP/wolfclip) | Clipboard history for macOS in a Win+V style panel. Free and open source. |

WolfClip is ad-hoc signed, not notarized by Apple, so the cask removes the download quarantine after install. Otherwise macOS would refuse to open it. The app updates itself from GitHub Releases, and this tap follows the latest release automatically.

Uninstall: `brew uninstall --cask wolfclip` (add `--zap` to delete the history and settings too).
