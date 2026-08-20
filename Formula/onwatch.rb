class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.13.4"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.4/onwatch-darwin-arm64"
      sha256 "225a5d1960986213285dd2175df8846a66236ad3eb571f3949a2bbc62f01ee74"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.4/onwatch-darwin-amd64"
      sha256 "eae8e41a32d3fa3c5bf23f31fefe68a3066b43dbff25eb6e91b418df35ceb231"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.4/onwatch-linux-arm64"
      sha256 "19d11be3a4bc805933ac6f2fc4be457a8ee58312f3c8b678a3cc9168787a0dc3"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.4/onwatch-linux-amd64"
      sha256 "eaba0b949a555bdcd823970ae5a56f05b3bfe9c631dc9064c9982bc94b981a39"
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
