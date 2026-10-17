class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.12"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.12/onwatch-darwin-arm64"
      sha256 "e657196829745e16f410db9ad1d68fea5cfab8e9e58c2d8ec40e7b150211f3ad"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.12/onwatch-darwin-amd64"
      sha256 "f26e9074b449fa64f91dd88119f726071e80edcad5562269f17903607038c1f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.12/onwatch-linux-arm64"
      sha256 "98d7167a479cc8946cf2f8db432028fe74193d28b1f1212bdba6d679db16e6b7"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.12/onwatch-linux-amd64"
      sha256 "c2ca02ff4ea9c89e390bd6e4742772e18d053b1bd6a8c0b123eea732a45447bd"
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
