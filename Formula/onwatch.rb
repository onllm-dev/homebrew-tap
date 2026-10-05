class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.9"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.9/onwatch-darwin-arm64"
      sha256 "36250625bec48b4984ad9aa442153c2f7ebed04d2bd94e9281b921ccf4156e8a"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.9/onwatch-darwin-amd64"
      sha256 "aec71657b8544684d56ff2e13c90c448361cbcda59b33413e78133d4f410d215"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.9/onwatch-linux-arm64"
      sha256 "345efe7935535f942a05acc739e1f1b0740895390b44d9e4ee48a57843bd87e0"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.9/onwatch-linux-amd64"
      sha256 "bd119649d865e4991e29224706f55d7781af5ccae0b0b36f4e5a91f5f2a48156"
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
