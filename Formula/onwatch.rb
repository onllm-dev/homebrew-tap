class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.10"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.10/onwatch-darwin-arm64"
      sha256 "27ebe2c83eab361655171295274398ffb1423a120a4c16e0908a9425538c7fb9"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.10/onwatch-darwin-amd64"
      sha256 "2e1bc57797d856c542962e0fe58d7aec8e53040e420af153d4f25946ad4326e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.10/onwatch-linux-arm64"
      sha256 "b2ef41a5cbbe93a5bfe13e30cfa481603e1aa5047c504ffbce004f05a4ff29d8"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.10/onwatch-linux-amd64"
      sha256 "7ad6f1144a598ff180df0f2766c485fc15c1e1d4838ee99ad4357a496133a960"
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
