class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.5"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.5/onwatch-darwin-arm64"
      sha256 "0b8ca3665a3b082ee9976a686d9021f29368633484dc5b594f03ba06c3304c80"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.5/onwatch-darwin-amd64"
      sha256 "00b7123dd811f56e5af49138a8545c75d297a8d532ae197f745e26ce81f8ea87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.5/onwatch-linux-arm64"
      sha256 "2a55a51d9281dd676ff0cd08ed270b244808eeff4b2ba5e62b77cba1e7c26ab6"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.5/onwatch-linux-amd64"
      sha256 "31aeb187efd3b9e1eb358e910f216e66fe84a5f6fe293b23f011994f04ff058c"
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
