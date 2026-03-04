class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.4"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v#{version}/onwatch-darwin-arm64"
      sha256 "cdee924bbbfc0d12d115707baed1a204f36d6e6e17f14624049bea1e3d680b2c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v#{version}/onwatch-darwin-amd64"
      sha256 "fb1c32969970c660829db0cb86dcc5597f9a050213fc44a27b151f005baeb1ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v#{version}/onwatch-linux-arm64"
      sha256 "e862a553ecad10c0944884e2fa442604ec27d890725c7d40cf67b09876789c3b"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v#{version}/onwatch-linux-amd64"
      sha256 "0a221321891d512bb571ce6a5757b53058bb76aa45433f8d1428aa65eedfab63"
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
