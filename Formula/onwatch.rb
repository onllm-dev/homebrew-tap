class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.1"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.1/onwatch-darwin-arm64"
      sha256 "3d10a24a94739c1533b3f0b67440a41d2d81021085877f663f821574fa5108f7"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.1/onwatch-darwin-amd64"
      sha256 "f6935501013807180b21216df6a1bba60239497a0bc7dde61c26f318edeb84c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.1/onwatch-linux-arm64"
      sha256 "ba97c91abe9081a1a599ed2f0ca2fbd4bacdce92f92ff58363d6389b51939393"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.1/onwatch-linux-amd64"
      sha256 "58c61349af1a6b602cd9dc96298cc82e6c572c108178a720d8c3cb788e46e0b1"
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
