class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.12.4"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.4/onwatch-darwin-arm64"
      sha256 "84e492dba5c21224942b92b664c59cad90afbaf16a0d3ab3cc5e3b1085ca78ca"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.4/onwatch-darwin-amd64"
      sha256 "9dcffe1bfa82f436b0d9811c34d9391ac5793384c627719055213027a2ae0b6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.4/onwatch-linux-arm64"
      sha256 "d56065d7eb427a2d559430c8cb4658a87642f5d1eab0448fa1640c02727b7e61"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.4/onwatch-linux-amd64"
      sha256 "dedf873d947e0b90f86decf8f0fadb290afe290d882ca5a5b1fa0f1492adee3d"
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
