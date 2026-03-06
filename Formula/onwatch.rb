class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.11"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.11/onwatch-darwin-arm64"
      sha256 "f3f9ab49f1adbb3a591741472a25f8ae6b3fb111d39dcfc0ecb9eae7fb0cd2f5"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.11/onwatch-darwin-amd64"
      sha256 "dd8a0cb46a464baf5bb6272c6add1daac6918957c556db1b2103b73474750dd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.11/onwatch-linux-arm64"
      sha256 "b5317c27e4a2dcd6af4dc6241b75ebe64d872d0b1cf5e376193f238432ace92c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.11/onwatch-linux-amd64"
      sha256 "1f7164d73d4f9528a4b2f928514b3f3fef41b12193e574212c019d5f79300d19"
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
