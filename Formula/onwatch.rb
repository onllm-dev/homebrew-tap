class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.13"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.13/onwatch-darwin-arm64"
      sha256 "f04af3ad3061e3c6b7605c4a7f9ffa98b09f23533f6cef55a754172d3776e866"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.13/onwatch-darwin-amd64"
      sha256 "cf15585c8a0695bc24394ea443091ac7027d436ffac937aaf0059665e3021a60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.13/onwatch-linux-arm64"
      sha256 "1bdef1709a5d96c08c1319d358945ec920a6bf47d89b3f051cd537f8e3b6424e"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.13/onwatch-linux-amd64"
      sha256 "d45042724c149b030bdf089fe3e3eb7f2accd57bbd8f7a474a17cca2ca114749"
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
