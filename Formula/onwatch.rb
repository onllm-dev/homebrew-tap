class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.12.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.0/onwatch-darwin-arm64"
      sha256 "46ddeff4558ac789263debe926279e38d95cd777839fed771aaec44e31da7205"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.0/onwatch-darwin-amd64"
      sha256 "343744034caae5e1e8af16c06cc0aecd56bafd6d49f3591b125f967e0e3fd6cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.0/onwatch-linux-arm64"
      sha256 "d1d8f23d0170ba67e2c97acc6a63380f075feb81d4ac61a39ddbcb059d76bf03"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.0/onwatch-linux-amd64"
      sha256 "9316158952ca858e1ff2354631561655a3b8b7e688120473ef8ba43e43b780da"
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
