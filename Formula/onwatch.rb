class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.29"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.29/onwatch-darwin-arm64"
      sha256 "2ef0a13a58caf0447d69c746f062449e76a2fa3d672efc53aed185d248459318"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.29/onwatch-darwin-amd64"
      sha256 "fba713956d4203d42a5be824f949bd425ddbc81a9408d3a72e8c1a1f525f1073"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.29/onwatch-linux-arm64"
      sha256 "a41fb1a27cd53a1e54647e937a4211582d38da7297a42843aef88183bb54084c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.29/onwatch-linux-amd64"
      sha256 "c13d336f51625f04fa700661d3531bbcbd4915021ad8caa01c40a21631387217"
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
