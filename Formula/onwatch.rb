class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.26"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.26/onwatch-darwin-arm64"
      sha256 "dd0dc6ae7ca08f444a166e4f0ae71de365025f7bfb8b7a8947e183fe0250c159"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.26/onwatch-darwin-amd64"
      sha256 "3f7cde4dec240934689edfcf1b86f93e839c4e9cba9265658a57a3648a49762b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.26/onwatch-linux-arm64"
      sha256 "8a1c1b74d57a11c9c6f0c5b4d8b8c9aeabceaccfd6bcb8c317ae4c796ff193de"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.26/onwatch-linux-amd64"
      sha256 "a557350fb06ab3bf999077cf23ad4eea28825e9ee1fd71f5f917e6eb167302ef"
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
