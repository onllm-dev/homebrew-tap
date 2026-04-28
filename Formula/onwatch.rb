class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.44"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.44/onwatch-darwin-arm64"
      sha256 "dad129b4f660d098ca5f2de2cb858c53b2671a1c4d357fc3e07839301bce7c33"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.44/onwatch-darwin-amd64"
      sha256 "81d9e3c7808f863012a82e424c3c8cef7d49f05a68cbc5654cecbc2e0a4b5b48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.44/onwatch-linux-arm64"
      sha256 "f1ec2479b1c2cb7f5980678f9aabcc05b0e234fc06efe1abb613e68c625bc7af"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.44/onwatch-linux-amd64"
      sha256 "5c3f6e1926c80d25f81961cb246b0f3ff3e54e3f02f199293623100bc3186cf0"
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
