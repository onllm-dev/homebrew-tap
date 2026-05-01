class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.45"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.45/onwatch-darwin-arm64"
      sha256 "59a1b75584bdfd74b1b8d17b5b8e402f77f8cc6ca2859488fa12e4372842e5fd"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.45/onwatch-darwin-amd64"
      sha256 "b3cc846e983d3e63bac14929dd8d1fb937007e3fefb696fcff9f5c5b53af47e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.45/onwatch-linux-arm64"
      sha256 "b0db413c3901b31dfe0136587792091f8467501087f3e8943a2966730644860c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.45/onwatch-linux-amd64"
      sha256 "2961ed0000959d9ea132b67f0b2171af4ad53031bc663e549d30502d4f4181c0"
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
