class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.28"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-darwin-arm64"
      sha256 "f1ecef035fdf247de53a310d532f5f11dccee8423c36955f0ca7d7bd99a49ed6"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-darwin-amd64"
      sha256 "0e690df784b2857c07de6a5a93546a96e815bad04b2268f1af401f87ed4ff2f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-linux-arm64"
      sha256 "d7b2020399ac9fd6479123d3bd39312f87e6294bb464107cdd6e3fc6ef6c6b9d"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-linux-amd64"
      sha256 "e3b824320ab208054e159b2a75db6c2e1876b4f3f69133494b5f53d953107486"
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
