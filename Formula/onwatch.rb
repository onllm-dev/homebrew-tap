class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.21"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.21/onwatch-darwin-arm64"
      sha256 "3927ccaf2df5c3cdd6c4d61b1134ae7b3c61f324817de86caf86a61adb2185fb"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.21/onwatch-darwin-amd64"
      sha256 "aa335ef940b9b0771d1c98aa84e45befe966adb0b657f0d3b0dd58d94a5544d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.21/onwatch-linux-arm64"
      sha256 "09e5a1a89f1ab4d47f3ebb8ba8287e335b59e2a366d1d4247ecb2295154a26d2"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.21/onwatch-linux-amd64"
      sha256 "007c47ef6435032e08f56a794f0cfff9cf52aa69327eed807b0e8290e87b5d8e"
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
