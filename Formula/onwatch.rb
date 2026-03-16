class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.22"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.22/onwatch-darwin-arm64"
      sha256 "3e6f2da2e5bb2d81e753839a70f34de488f1602a6ff8e5d9274fedafc216964c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.22/onwatch-darwin-amd64"
      sha256 "5cefbfb75abef159650a1aa84b4aaf1a64650032e6ae0d5b68e9e77487c1cd38"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.22/onwatch-linux-arm64"
      sha256 "31c090a5aea25201d705fc898da80068f071a3d4a42e4e56688561259f094cc3"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.22/onwatch-linux-amd64"
      sha256 "6f76d9364d2555d948f9613b4e8ccc2d4bc5f5103766f5e6db9b3cf1c40c085e"
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
