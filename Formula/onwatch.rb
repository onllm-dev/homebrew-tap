class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.43"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.43/onwatch-darwin-arm64"
      sha256 "6c8f627fdd52b7f30ca1da477c8268147fdfa317a31ddc4aedc914e83c043db1"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.43/onwatch-darwin-amd64"
      sha256 "a73c7462059fed1b371845eedd08a4c0242c32c1197f9368438493d5f40e5500"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.43/onwatch-linux-arm64"
      sha256 "1237aacfe45ffefa16168e2ee23e12ad383c16a552c0d784064b7b14b348d0b5"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.43/onwatch-linux-amd64"
      sha256 "c0252a670b680557d9ff8778d05f04735dbdc95a126a33ab7bef512e25ddf4f6"
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
