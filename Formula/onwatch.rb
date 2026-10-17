class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.13"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.13/onwatch-darwin-arm64"
      sha256 "4429e48267e9cd01c811e14d0c55860337c247980f67fd582b0f4846cc92c56b"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.13/onwatch-darwin-amd64"
      sha256 "afac7ccb09117a4598297e6a612e204d45469e414b6ee41fd32afe85a1c89e46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.13/onwatch-linux-arm64"
      sha256 "6ed6937e6469ab0acc654a1f73c6755a151b431b306c4e855755f86284e19dd6"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.13/onwatch-linux-amd64"
      sha256 "68614ff9d84ed49e30466bcadb55d0fb6585dfc48012568a88465fd396e44d58"
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
