class Onvault < Formula
  desc "Seamless file encryption & per-process access control for macOS"
  homepage "https://github.com/onllm-dev/onvault"
  version "0.1.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onvault/releases/download/v0.1.0/onvault-0.1.0-macos-arm64.tar.gz"
      sha256 "5f49ba829a13fff00f319468e2b0687b45ee680049904ab70f92c2619eadb939"
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
    launch_agents = Pathname.new("#{Dir.home}/Library/LaunchAgents")
    launch_agents.mkpath
    plist_dst = launch_agents/"com.onvault.daemon.plist"
    unless plist_dst.exist?
      plist_dst.make_symlink(prefix/"com.onvault.daemon.plist")
    end
  end

  def caveats
    <<~EOS
      onvault requires macFUSE:

        brew install --cask macfuse
        # System Settings → Privacy & Security → Approve
        # Reboot required after first install

      Get started:

        onvault init
        onvault start
        onvault unlock
        onvault vault add ~/.ssh --smart

      Documentation: https://github.com/onllm-dev/onvault
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/onvault --version")
  end
end
