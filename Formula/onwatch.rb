class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.19"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.19/onwatch-darwin-arm64"
      sha256 "1f358d29bf54e93d687f3979e6bbc708757d64bf921d7e6bcebebc254d18f76d"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.19/onwatch-darwin-amd64"
      sha256 "e82a9a00954c4c140ad4c4d7369890fbf97a3c11babd70583222c11f7ee47ad2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.19/onwatch-linux-arm64"
      sha256 "cc5b223e87c649904b70c9831cc51c5795a54dd2c56993dae803d20a9a542709"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.19/onwatch-linux-amd64"
      sha256 "2d427dce4e43fe323b76344a96f4d546763a7e19942eb47cd0910020deb653f0"
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
