class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.30"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.30/onwatch-darwin-arm64"
      sha256 "76d18d1e8791c4467b4dbdad873a63dd0c7615058d7cb19594d4fc595ea7577c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.30/onwatch-darwin-amd64"
      sha256 "b281f6edb6487d82c05f730e9435bf00898703dfa4d22b5852f7e60f9180c185"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.30/onwatch-linux-arm64"
      sha256 "c2a2120e4fc6a8580aa2640b0b8190f1a89e28556779effb1cd2158c0cea18e5"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.30/onwatch-linux-amd64"
      sha256 "2f195baa8701c14a031224afdbf5f0423a7df78d795aef2894468d2ea70e18f2"
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
