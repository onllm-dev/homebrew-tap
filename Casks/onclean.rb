cask "onclean" do
  version "1.3.0"
  sha256 "9d222dd646579b7b08578db50f01db271f1140be09bd68122d55a66d0e344b47"

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
