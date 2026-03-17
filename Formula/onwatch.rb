class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.25"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.25/onwatch-darwin-arm64"
      sha256 "6ac66f7352acfea0143ff4b49197dd11fdc2e8f9ee1f159d5ae3e23d59b9ab98"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.25/onwatch-darwin-amd64"
      sha256 "e954b7df65c0cc82ec8e1cf69f8e52e71ef2e911edeaea729101c702c93ec6ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.25/onwatch-linux-arm64"
      sha256 "70a0f6fe910c3b164538e82dd976cc76e5e3e9672f8266c2a0ce5711edd89822"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.25/onwatch-linux-amd64"
      sha256 "c268a82c2237eaeb4b4dc0c30fe618a16cc665fdc5a8adaed031ec9125a97e21"
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
