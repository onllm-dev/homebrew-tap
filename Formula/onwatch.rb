class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.9"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.9/onwatch-darwin-arm64"
      sha256 "cdc99dbb0bdbd149c708c9a95c4e9f6e4e810379be6e8acd850615af61a0f0ad"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.9/onwatch-darwin-amd64"
      sha256 "57c4976354f3c0f1de4eeabe617285d6c94e8776fafd81376196f2d3b85d439b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.9/onwatch-linux-arm64"
      sha256 "77fd733b3cceda5363f34a5663db057c818a97bcb5c4e96e674790b8424233e1"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.9/onwatch-linux-amd64"
      sha256 "6b46a6770d7283df1863fc803687ecb2fadc6b8743ab4e796002cc281e26e24d"
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
