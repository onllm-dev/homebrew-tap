class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.17"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.17/onwatch-darwin-arm64"
      sha256 "38a7ffe19dad8abc7928ffb5218fb5d6cd310d4cc6ab1b77c24dbe6f11b07b29"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.17/onwatch-darwin-amd64"
      sha256 "e39d605c1d2016bee17a4f88536a164d1a47c878319f8a89ab0fb77d97acd0b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.17/onwatch-linux-arm64"
      sha256 "7e29823a9cf177e4551e7c8ca25b1778a86211ab9b1ab0a8da328c093e12c48e"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.17/onwatch-linux-amd64"
      sha256 "a463c5d5b456bbcb20f7384b17cd1fd9d276da5b685a9e571fa2cf0dcb4d2a15"
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
