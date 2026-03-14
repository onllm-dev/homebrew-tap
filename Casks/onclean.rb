cask "onclean" do
  version "1.0.22"
  sha256 "ea5f382270b469b8a78cfdeda76ab9ae1d0179e83b81b1dfb4ed326d3059ef22"

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
