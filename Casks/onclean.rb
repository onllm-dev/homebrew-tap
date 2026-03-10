cask "onclean" do
  version "1.0.19"
  sha256 "e362932db07ec9237575f076720ddf0fa084a7508a1094dbac5ece474c946f60"

  url "https://onclean.onllm.dev/releases/onClean_#{version}_aarch64.dmg"
  name "onClean"
  desc "Lightweight macOS cleaner with minimal footprint"
  homepage "https://onclean.onllm.dev"

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "onClean.app"

  postflight do
    # Remove quarantine flag for smoother first launch
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/onClean.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.onclean.app",
    "~/Library/Caches/com.onclean.app",
    "~/Library/Preferences/com.onclean.app.plist",
    "~/Library/Saved Application State/com.onclean.app.savedState",
  ]
end
