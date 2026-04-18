class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.42"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.42/onwatch-darwin-arm64"
      sha256 "22f2029015939a6155fbc5642f377e7e2014cd7ab3176fafccbd775e662d0e20"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.42/onwatch-darwin-amd64"
      sha256 "958291fdf600cc634f9ad4a8e573916742502cce87f8d6730dd57bafc8a37588"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.42/onwatch-linux-arm64"
      sha256 "b9f92d04149c589d2ed971491a96132d9b2c63efb6e7020ffb55c5d3b97b777d"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.42/onwatch-linux-amd64"
      sha256 "b5c63b8489804612248bcbdcdaedfd5aeccf46850d6c7eb53f3299516f98b602"
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
