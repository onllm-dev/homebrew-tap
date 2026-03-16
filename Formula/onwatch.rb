class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.23"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.23/onwatch-darwin-arm64"
      sha256 "41c16090e7066f49c7872fc96c7ea28e6ba004c2d955dc1277c24ac4e0028bd2"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.23/onwatch-darwin-amd64"
      sha256 "dc76229405d8580018fb03755896b2e03d8af56ba6f2194470132e41010b2548"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.23/onwatch-linux-arm64"
      sha256 "6c2acbf4a78386c530ef0c9ff668116db9ae1fff875a032692ed1bd69eb91322"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.23/onwatch-linux-amd64"
      sha256 "c17a86ae2638791c4256498754fbaa7be55f4c3dc8809c4f05d4a6b4072cff83"
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
