class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.7"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.7/onwatch-darwin-arm64"
      sha256 "379b89270e158e8761416ebcea19ef70c261feac87a0034ef9c09f05836da82d"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.7/onwatch-darwin-amd64"
      sha256 "8032d7c635392e4543b967d54a79d0938f85493ccf5284c29da2365a406db6eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.7/onwatch-linux-arm64"
      sha256 "c72ee148b419bbbdf920ff7536ad4ffd5b4ed49e635dfa0882755486b34aeab4"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.7/onwatch-linux-amd64"
      sha256 "9b47cc6f4f8da77620e02cfea93b1162812ad43c0f5661b42d25b659d89b4c45"
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
