class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.13.6"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.6/onwatch-darwin-arm64"
      sha256 "3840f40415bbee1176094b8177d630d8fdd20e24e4f57197195bb592307541d1"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.6/onwatch-darwin-amd64"
      sha256 "c2b0076ae553fae03eb363d27f5d5c03d99dedd60273e358fafa6e910056c2d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.6/onwatch-linux-arm64"
      sha256 "74323c1df9e12b3682e59e9a1f5c77551800b139d38e55cf848ffe8be1424ccb"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.6/onwatch-linux-amd64"
      sha256 "9ecd50cbb8d810a80dedfc3ff3b33406354707dd9b5735b86fdd9f4208301f0d"
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
