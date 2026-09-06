class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.13.7"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.7/onwatch-darwin-arm64"
      sha256 "2637161f079f4a0fc12b7749a557f0fd914bb19ac82ea6e0930143491c2c053e"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.7/onwatch-darwin-amd64"
      sha256 "2e12e6126705df572ae44303d0a6cda41904dcb264b99eb6236a78065698e591"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.7/onwatch-linux-arm64"
      sha256 "6f88ed80445ac1f211196eed420b658311646ed4baa13c361723ed1beb69d765"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.7/onwatch-linux-amd64"
      sha256 "71f4df501e05dc0c3578154360304a3034a487d1b511c7e2647750e6e4cd7005"
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
