class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.15"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.15/onwatch-darwin-arm64"
      sha256 "93072f5f1d93039371886f42c83af591eb552f1975d094bea72ffb150e1b4f48"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.15/onwatch-darwin-amd64"
      sha256 "61a8493ce26e515502a8778487e0f3a041c8d81e9f5d2370471b57ed8a4ece2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.15/onwatch-linux-arm64"
      sha256 "c8db5edd721072507483d973e7c47f0891da220d7a3871de575ef6408e555a43"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.15/onwatch-linux-amd64"
      sha256 "96ac11105c8ee337902e776aab02891ac92ca027ffe48fad28789fd7828b3c75"
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
