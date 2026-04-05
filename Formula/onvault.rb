class Onvault < Formula
  desc "Seamless file encryption & per-process access control for macOS"
  homepage "https://github.com/onllm-dev/onvault"
  version "0.1.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onvault/releases/download/v0.1.0/onvault-0.1.0-macos-arm64.tar.gz"
      # sha256 will be updated after first release build
      sha256 "PLACEHOLDER"
    end
  end

  depends_on :macos
  depends_on "macfuse" => :cask

  def install
    bin.install "onvault"
    bin.install "onvaultd"
    (share/"onvault/defaults").install Dir["defaults/*"]
    (prefix/"com.onvault.daemon.plist").install "com.onvault.daemon.plist"
  end

  def post_install
    # Create LaunchAgents symlink for the current user
    launch_agents = Pathname.new("#{Dir.home}/Library/LaunchAgents")
    launch_agents.mkpath
    plist_dst = launch_agents/"com.onvault.daemon.plist"
    unless plist_dst.exist?
      plist_dst.make_symlink(prefix/"com.onvault.daemon.plist")
    end
  end

  def caveats
    <<~EOS
      onvault requires macFUSE to be installed and approved:

        brew install --cask macfuse
        # Then: System Settings → Privacy & Security → Approve the extension
        # Reboot required after first install

      Get started:

        onvault init               # First-time setup (sets passphrase, shows recovery key)
        onvault start              # Start daemon (menu bar icon + web UI)
        onvault unlock             # Authenticate and mount vaults
        onvault vault add ~/.ssh --smart   # Encrypt and protect ~/.ssh

      The recovery key is shown ONLY during `onvault init` — save it securely.

      A LaunchAgent plist has been installed to:
        ~/Library/LaunchAgents/com.onvault.daemon.plist

      To auto-start on login:
        launchctl load ~/Library/LaunchAgents/com.onvault.daemon.plist

      Documentation: https://github.com/onllm-dev/onvault
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/onvault --version")
  end
end
