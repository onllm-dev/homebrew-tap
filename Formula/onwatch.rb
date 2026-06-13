class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.12.1"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.1/onwatch-darwin-arm64"
      sha256 "bd0568635493bf47126fa9ab5c5105c20c4551ed092f418ae65992c455039205"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.1/onwatch-darwin-amd64"
      sha256 "3824569a833086b3860bff57c1af370d7e0b8bd161a298e5803479c747176b83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.1/onwatch-linux-arm64"
      sha256 "548eb65611f5adfe15de01e5226f8ece5dfc0e8933cc2ccbeb4dd5ce70aee3ed"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.1/onwatch-linux-amd64"
      sha256 "9f6ee3a75d9d173a85aea2aab9d14e3da12318b93d821359fb44649a91cc59f7"
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
