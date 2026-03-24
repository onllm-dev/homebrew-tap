class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.30"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.30/onwatch-darwin-arm64"
      sha256 "539afb4ae7c5523f79962db0924d295e4a2adccc95f1c557c71ab2e956de3a24"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.30/onwatch-darwin-amd64"
      sha256 "c65c61ff0e89dda408eb4c0e70f1fb13b620d43fdb4f0accf524e567d1cdd492"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.30/onwatch-linux-arm64"
      sha256 "7f81651cb4fb1d18d7132308fd2686bc424a2af46d03fc12617cb3123c8e63f5"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.30/onwatch-linux-amd64"
      sha256 "8a8fbfbdcb4fcebab00f22fd1e94f39ba81fd6be77a6227f0205012ea3626702"
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
