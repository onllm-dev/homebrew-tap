class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.11"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.11/onwatch-darwin-arm64"
      sha256 "05593f7f51af46380879a323575da437db9477332c97e9984ba66b08c9f7ad26"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.11/onwatch-darwin-amd64"
      sha256 "f64e3a862e24f06302dc2dbc6ba5997105767e06cb2f4aad14ab465038259566"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.11/onwatch-linux-arm64"
      sha256 "8dfa96c2f976ea008c18b7e0e9233c7937b7aac9c2340757a424cecfa5cd0a45"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.11/onwatch-linux-amd64"
      sha256 "252ee301a08d158950efeacec1e820fa140e0b0b1ca9b900b72ba23bd4a7f7e5"
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
