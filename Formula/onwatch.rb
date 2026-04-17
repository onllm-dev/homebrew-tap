class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.41"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.41/onwatch-darwin-arm64"
      sha256 "3622cba67bbad5fd8ab8eec69ea410323013d797c224ea7e22e71b0521d59f39"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.41/onwatch-darwin-amd64"
      sha256 "75d07f0c319d4439845dbe24e52dee57c5bc291a8f16473f054864e311c5331a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.41/onwatch-linux-arm64"
      sha256 "9f6d11646076ba8df2ea474f56fd6ddb18d2cdd0efdc22143ac7027541ae07ec"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.41/onwatch-linux-amd64"
      sha256 "1f2c1d3dc752d680e60a48ddecf79b43cc68650cb7d43aca7a04391c4f7d9241"
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
