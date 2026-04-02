class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.35"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.35/onwatch-darwin-arm64"
      sha256 "2b9eb9f7214e9fd4f2b2864cecc19c9578ff385f3ff933ec654aca2da3c11ae3"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.35/onwatch-darwin-amd64"
      sha256 "3bb2d520758dd6b5b9b8ec2417f7b4d7ce6d21b4621f27c5ba472b700f70b764"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.35/onwatch-linux-arm64"
      sha256 "0c31a5a4dc934e2835b0d8f9fc1c3c60ff08deb4141c11909b3a2bd1cdb7918c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.35/onwatch-linux-amd64"
      sha256 "1b2490b6fcfc1707ef1b43c9a6f7965d55fb4b5e5987081b9b300c787586a6b5"
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
