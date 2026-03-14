class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.20"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.20/onwatch-darwin-arm64"
      sha256 "5472ef81724a39ef0c930475598fa5a128cf43c1082010c0e07597d6a3955755"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.20/onwatch-darwin-amd64"
      sha256 "5cfcd6314de8ae09ca651f722c0f96a8f8010ef4e54589945382efd3b384d206"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.20/onwatch-linux-arm64"
      sha256 "0e71f2d842fd7c7d6ed29bb8ccee2482229cbe23ea61e86badaf2b09c71e7c0d"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.20/onwatch-linux-amd64"
      sha256 "f7602adefde3cf52173501e336901395f4f5533e0dce658d91878c389c3f8711"
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
