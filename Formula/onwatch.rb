class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.10"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.10/onwatch-darwin-arm64"
      sha256 "2ca84aa9b639aa23cc6940b40e2a161f9e559e00946305c418c97ee35f76f873"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.10/onwatch-darwin-amd64"
      sha256 "9dea75222f933f90d0bce82b2c863b4b3f3a42cc8f11ded34602e53fc02af3a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.10/onwatch-linux-arm64"
      sha256 "d1f3d5d2faa4046fe0ae27d1c36a84e550663fb58aebf8adddc6667995dd930c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.10/onwatch-linux-amd64"
      sha256 "b6296748694c9fd970b85eb71a0cd8728f67cb550a756f6e13e7e603109dcde5"
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
