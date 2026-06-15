class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.12.3"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.3/onwatch-darwin-arm64"
      sha256 "5cef11e7fe4e6f93c1f6973b8b62a1e23f6ba6771234f3f46a48e09ac9fbd89c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.3/onwatch-darwin-amd64"
      sha256 "7c84b7bfbe924a8ec6ca0e8cd593c6fa4f5dde786c842080e5527fed9efe7859"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.3/onwatch-linux-arm64"
      sha256 "e67621372e4f83a1adf9ae5a6cc080c0223a913748fb6d80e4734f343c97a085"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.3/onwatch-linux-amd64"
      sha256 "99b9d1a14cd7f4f7269c46a65306d2a518385cb0445845181240e8ebcc2b353c"
    end
  end

  def install
    bin.install Dir["onwatch-*"].first => "onwatch"
  end

  def caveats
    <<~EOS
      To configure onWatch, run the interactive setup wizard:

        onwatch setup

      This will guide you through configuring API keys, dashboard
      credentials, and polling settings. Configuration is stored
      in ~/.onwatch/.env

      After setup, start onWatch with:

        onwatch
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/onwatch --version")
  end
end
