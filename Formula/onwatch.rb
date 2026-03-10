class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.18"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.18/onwatch-darwin-arm64"
      sha256 "aa93be6a66a6df56f37561135e23d4404abbbf8146e1060a3c90db98f36fe7a5"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.18/onwatch-darwin-amd64"
      sha256 "f5b3d87adb06e9e314274c42f08f3d44a00730f428fb2777b5b8a2ae4741c69b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.18/onwatch-linux-arm64"
      sha256 "a50bc149ab3a3c2c16fe74ccee03c35d0823608ba7f342b15fb2219a60cb9494"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.18/onwatch-linux-amd64"
      sha256 "25cb7c4cbf9637f10c4360f3f158e56468f19eeb1e8f6e9834bccb6ea6c79ca7"
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
