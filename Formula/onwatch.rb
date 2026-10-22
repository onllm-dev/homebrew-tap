class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.14"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.14/onwatch-darwin-arm64"
      sha256 "2972bfec9189451b5130a58ac78e6a2b9dc4bcbc015a359b674cea3f501c93d2"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.14/onwatch-darwin-amd64"
      sha256 "f46d6a4b97eea35abe3a8cf1fbd575110ef37b89b474ad7fee7be31c6fa9831c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.14/onwatch-linux-arm64"
      sha256 "3f3401726dd7aaad1d81013f4c0100ef378ef8d09da3af18d6b8695ff80c452b"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.14/onwatch-linux-amd64"
      sha256 "e2e59823520d8a0c90586e0dccf52c1c5dd865a3fea0435d0100d9e0e434d355"
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
