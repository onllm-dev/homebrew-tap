class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.34"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.34/onwatch-darwin-arm64"
      sha256 "6f7d37c7ccd660bbf77659b8847ba3dc919d5561b32faaedf5c14c8d6f2fd121"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.34/onwatch-darwin-amd64"
      sha256 "2e58c9cdc1eea50631bcee045332bae3121dd3201e7b2e4309831c3879b8e116"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.34/onwatch-linux-arm64"
      sha256 "acb4a3cb0218947c95272c2784a01adbb8037b668bc43e37fffbc866e49be840"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.34/onwatch-linux-amd64"
      sha256 "b19462c0b466af800ab28328932e06661479f0c27969a19a445ddb061a5bb40e"
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
