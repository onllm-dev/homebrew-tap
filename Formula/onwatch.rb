class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.13.1"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.1/onwatch-darwin-arm64"
      sha256 "c16fb6a70cbd11891e4aeb165144144467198d06e63385e484fa7c8f06de1b8e"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.1/onwatch-darwin-amd64"
      sha256 "647140975bf81d0568427267f23fb21aa44e1046cc6277852e70d3743283d746"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.1/onwatch-linux-arm64"
      sha256 "554b0fcd4dc4cb5d079a58f7269c57dde59a175d0815f2439cbb6f5bb26c7034"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.1/onwatch-linux-amd64"
      sha256 "872ca31ada8a07d01e37bacc3132af8314a8e3b4329e51525380a85bbacdd29b"
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
