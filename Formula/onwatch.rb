class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.0/onwatch-darwin-arm64"
      sha256 "8d1c08f456ed051527a85fba3ab09582cf8d1778c46b597192dafe3bdc7c5a6c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.0/onwatch-darwin-amd64"
      sha256 "cce5a41b93ce0fa6e975501eea1c9d964ef4f8c95d5a947caa1e005128c7f5dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.0/onwatch-linux-arm64"
      sha256 "afa5e0382c487188a0822690cf3d75737c03238003f74764c44b03bc2c825519"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.0/onwatch-linux-amd64"
      sha256 "e61fc25b22e8dc24636df44942201d17f0c7048fcb4e0f2afcb40b9329ec0aa7"
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
