class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.16"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.16/onwatch-darwin-arm64"
      sha256 "7c8a3e4dc2e4ecc9825cde9d896c25ce461ec301cfe760ce3a85c34d2a48ab36"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.16/onwatch-darwin-amd64"
      sha256 "fc869949f6aa4fbf4b4ea55e8e397a8af47506b6820d4ef8f07a4c2b825e19be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.16/onwatch-linux-arm64"
      sha256 "ef842a6c6f7e992ce1b03630c97f29606740f5dca7e04d4ef4948fb05ee28ddc"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.16/onwatch-linux-amd64"
      sha256 "06d6b9bf27a5823e8f8c0c39acdbf2f94ace4cf46e7d1d032f2d2608e1913863"
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
