class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.36"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.36/onwatch-darwin-arm64"
      sha256 "010d18fc0f9f4bc89aa75e83ff2398b6f747996db1aafdb35c55e4207c3f2b3b"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.36/onwatch-darwin-amd64"
      sha256 "28847107fe7f4c1d70eec13e3b04b02b02c8b81a3295b00241399c923f842b75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.36/onwatch-linux-arm64"
      sha256 "28695b3d716e6a699127bcf737e433448561edb83ab2944a06ad98c8afaea428"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.36/onwatch-linux-amd64"
      sha256 "fe825060203bffda1ea22aef52bcfcf25b638e549de1e51cd52a083ea7da8fdf"
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
