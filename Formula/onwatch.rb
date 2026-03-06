class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.12"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.12/onwatch-darwin-arm64"
      sha256 "dbdcb7ba822f5197879efc34f8583acde98504a27c4b9d1ecf70c814c1d37cfb"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.12/onwatch-darwin-amd64"
      sha256 "ef1ad20731177a9d4286c1e1a2b80e91182dcaaf58f246f55532f481c68f8287"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.12/onwatch-linux-arm64"
      sha256 "5e045fb85f31db3ad7f2f15fb6fef5f23afba2d052776003a1c42f127e19edbe"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.12/onwatch-linux-amd64"
      sha256 "37133a1bb62963f315603e867f12ae87d207ce79e497961d04ee702fcdd762a5"
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
