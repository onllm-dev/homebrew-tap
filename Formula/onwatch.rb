class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.12.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.0/onwatch-darwin-arm64"
      sha256 "7ab73615a3cceea9c53db837496cc4335a7bd462175ed3d8ea78a203b00945d6"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.0/onwatch-darwin-amd64"
      sha256 "cec26aaba5f8867f52f6f1c0e84f59debd8ef9727e78079f4d4616fa2a8e4646"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.0/onwatch-linux-arm64"
      sha256 "815b44801b40ae7b2b578035aef4ffa4443576da876479fe1ef47297554c6e97"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.0/onwatch-linux-amd64"
      sha256 "4aede1dd172ce764a3e93e4bfb6c21a0051f72746e18f15608b97228afd693dc"
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
