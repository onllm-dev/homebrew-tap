class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.7"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.7/onwatch-darwin-arm64"
      sha256 "35ef95a53e390f135886d63f56556863852ef8f8ba9d32feaa4a52f3bad681b0"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.7/onwatch-darwin-amd64"
      sha256 "f80a18c8aa94e35528876472601e3cd1c639755651b54f84b6c479ad03f21c77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.7/onwatch-linux-arm64"
      sha256 "668c3f2fb126104b6d65a7eb56407418b305a368c7c309b8533851b7dc787839"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.7/onwatch-linux-amd64"
      sha256 "53cdcdd976be183b83bb3c6ad89edfc57f17995a541d985e0c10335028ff1d81"
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
