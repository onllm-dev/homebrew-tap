class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.38"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.38/onwatch-darwin-arm64"
      sha256 "4aabc0e0b2952618b5911aea8592198b5cbecf86a411003a1a2311428c517dbd"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.38/onwatch-darwin-amd64"
      sha256 "cda7a039e4390bba97256332f9f8d8dbced56cdf14ceaad0c33302e10a24e958"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.38/onwatch-linux-arm64"
      sha256 "216ce43eafc8fabae66461ab05d424249c9bcd20c28497ef7128ba831c77a406"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.38/onwatch-linux-amd64"
      sha256 "20a85b4d324d81bab9bc1e7a024e9e57692a108f2cfcda825757983926b30668"
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
