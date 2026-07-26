class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.13.2"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.2/onwatch-darwin-arm64"
      sha256 "96f9f12e3de9bb42cb1b3436a4483d6861b55fa636d27eec2d3c0e61499ec2de"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.2/onwatch-darwin-amd64"
      sha256 "3b755c333c69a97b8a2e3463eb37a8ca7efa6b80294acdd8bec7a27592dc0f21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.2/onwatch-linux-arm64"
      sha256 "6bf150586a014fcbed95a62abd9cac9aca2d0b2229b917d32432dd32e8be6aa2"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.2/onwatch-linux-amd64"
      sha256 "9f664798be5b116384e215527f25cce884210c7e7e8b7e0fa51d097ddef56f40"
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
