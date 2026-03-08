class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.14"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.14/onwatch-darwin-arm64"
      sha256 "481c4013e315512df56dfb69d70d0f562599d8cddb795861b28da52e25b70029"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.14/onwatch-darwin-amd64"
      sha256 "7549a1cdbb16a6a3a05e7f2faa1f42c01e3e7c0f6c1e746220ff285a0b70199d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.14/onwatch-linux-arm64"
      sha256 "5beada2e802701e6e4aeb934d5c15221ad56fb4d9bbfe06f890fa1a611803125"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.14/onwatch-linux-amd64"
      sha256 "d9915bab8c3f3f58133156879ff74ddde6a737456548646e4627ab6b940a7839"
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
