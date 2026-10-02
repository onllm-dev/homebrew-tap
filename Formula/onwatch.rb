class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.8"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.8/onwatch-darwin-arm64"
      sha256 "8a9d5b1a7e3b83776376b2842ced2dcb033666660aaa8b39a148e95234801e6e"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.8/onwatch-darwin-amd64"
      sha256 "5ea266c3de53747b6cb92a01f09f952c7209dbd55888314258f37614436cdee2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.8/onwatch-linux-arm64"
      sha256 "0054fdf2f1375f40fa5b28002acefd511030373d96b0b72cccdc97203faf942b"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.8/onwatch-linux-amd64"
      sha256 "04bdd059bdd818c28e239505ef41dc20c136deef0cc0e4a2641ed6b76ca7bf05"
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
