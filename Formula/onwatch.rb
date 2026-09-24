class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.5"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.5/onwatch-darwin-arm64"
      sha256 "216e9263379e0c1dd478818359260b35bd2d5ca9a178d36787db63d5e92d8298"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.5/onwatch-darwin-amd64"
      sha256 "0153ff8381a3ee8afcc1b041e3c903d00cbc9ce74b18e7c8b3266a23fd4e904f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.5/onwatch-linux-arm64"
      sha256 "eed142440bc618dc76f1298d047aa9e4b22dc229d9746890fcd80d82a5de002a"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.5/onwatch-linux-amd64"
      sha256 "ef7043e777dea0e7d2c9412cb3d8d215c0415e1631deb18a36675e0e7a31d4f5"
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
