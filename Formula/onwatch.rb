class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.28"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-darwin-arm64"
      sha256 "8ee149607b3ae5cc5b4130a85eaf76cd626070f2844514bfaea56aafe35b9d0a"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-darwin-amd64"
      sha256 "5aac9d89bb9528cc1635928e5766ed15143210eb1988cf35d55dd96486a53230"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-linux-arm64"
      sha256 "8e5e86f56a037730b15ce7141bb7f793a01d633ca49b9786cb27aad56b8264da"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-linux-amd64"
      sha256 "3cac302957e71f242aedf32c693b8264fbbaba628d31abebd3809f599102f833"
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
