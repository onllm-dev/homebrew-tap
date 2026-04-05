class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.37"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.37/onwatch-darwin-arm64"
      sha256 "ed78311afcbe8c6c6147592b8d17674bf3721b57786ec3399566d5debf5a6984"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.37/onwatch-darwin-amd64"
      sha256 "7c613da4f820811255df6c4fd515afb2a2c854bc01c333299b8a11c7e9474961"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.37/onwatch-linux-arm64"
      sha256 "06a4f91cf86803effca376df50cc86053aadd82e8df7191d3887af59d88311aa"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.37/onwatch-linux-amd64"
      sha256 "17af577db3a2038ffbe1bbb755f378d4869a76a0a777d6a2b8c99470d44ff815"
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
