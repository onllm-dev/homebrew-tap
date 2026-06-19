class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.12.5"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.5/onwatch-darwin-arm64"
      sha256 "1abf4e83f05ef092b4491da9f411a9eb1f3fbe8e1eb44ea0fb97c10c17d89b5e"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.5/onwatch-darwin-amd64"
      sha256 "b60b252d26b308a253c9682adc12bfb695077eb4deba781389b4e7f19f59d8a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.5/onwatch-linux-arm64"
      sha256 "a003674b94bb95d7be66b3a55ce8ea8e76ce1699410b41419af7b32351485528"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.5/onwatch-linux-amd64"
      sha256 "135e0e08ca326f637c1ff216544ff4a239af6306e574d1edd75fafb68aa6f64c"
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
