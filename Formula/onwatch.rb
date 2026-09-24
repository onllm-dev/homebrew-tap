class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.4"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.4/onwatch-darwin-arm64"
      sha256 "aa0bccd204a06d22e2ed767079bda900f9cb824b3d467859a6626cd18b43d2ff"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.4/onwatch-darwin-amd64"
      sha256 "b6fce996cdc1028d688f1adbf20d03ca69a57db31f54f7952606f5bd42603f96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.4/onwatch-linux-arm64"
      sha256 "ebf2bf7a645bb1a9ec7df5a87ce826c9a4beaa4220ed37d775f6b79e2c0a0eb3"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.4/onwatch-linux-amd64"
      sha256 "03599e20d9d4bc1d3d3b26fb374ffa1a967d10ec94db891c24160cb77f12ffac"
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
