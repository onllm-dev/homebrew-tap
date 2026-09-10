class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.2"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.2/onwatch-darwin-arm64"
      sha256 "cbef2814f481b213d3f99d5c01192b54c7f052e56f21b55ed6f2409c99358080"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.2/onwatch-darwin-amd64"
      sha256 "60b1a508310f12a5e808c1f2723e655a12a521d9b45916eac209463ea0911f1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.2/onwatch-linux-arm64"
      sha256 "f41f23a23c22f315d1f8b5fc975d3ef8b6229eb7ee5fc972f7bff180cd60ec84"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.2/onwatch-linux-amd64"
      sha256 "359f90ef51ee61f9adca080bd497292c0420d1222a79023e38f1a62049920491"
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
