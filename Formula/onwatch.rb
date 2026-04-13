class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.39"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.39/onwatch-darwin-arm64"
      sha256 "ab198f9124c2d72b24edbac98afc4c7f110bba5cdaad470dcf5684fad8153720"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.39/onwatch-darwin-amd64"
      sha256 "13e2290ad0181896f6c4cd1ca3bd2fb3caad1b526b99d7bd4c7c52af6da6630f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.39/onwatch-linux-arm64"
      sha256 "ce9b129d8f05b4d44c0381bac6c1282a00db09d43339ec3559a7b8050225d326"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.39/onwatch-linux-amd64"
      sha256 "4c0246898356a60329bac0679bfce709ce9ad8885d2ead7490f9020cce320191"
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
