class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.6"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.6/onwatch-darwin-arm64"
      sha256 "91521cbbca62448a35dc86809a346f62605dca6d864fb6888be5bbf020ba17a1"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.6/onwatch-darwin-amd64"
      sha256 "058e61ad321c0ab368e9bad19ae4553699f0097fc2449f119ed9dee38c093048"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.6/onwatch-linux-arm64"
      sha256 "33f25a7a5836f12fbce28fbd9ce51b7e4cbd0f1b09ddb5b683ee495bc3a76047"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.6/onwatch-linux-amd64"
      sha256 "bf0ff2e603f956080a42ad803c3ceb5c60afa5ce17ff4cc25c89776e62b32599"
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
