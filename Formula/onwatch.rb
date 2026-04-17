class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.40"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.40/onwatch-darwin-arm64"
      sha256 "87f0182db72f4eaaac68d814d7970a0f5e0f94dba5b1a7ebc0e937f7e818852b"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.40/onwatch-darwin-amd64"
      sha256 "faf86dd03cc2c2814e3b09b65a5daf613d634d6241ba38c6cd8f68dbec8d3c4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.40/onwatch-linux-arm64"
      sha256 "4d8f874eb07d82df6f27a7efd391530264a5bb6097b32d6e6177f9769c2f52e7"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.40/onwatch-linux-amd64"
      sha256 "46642248d92810d2dcff364b5b812376c356bb7195e3e38c174a0a3205bf6fce"
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
