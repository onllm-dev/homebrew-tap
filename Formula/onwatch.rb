class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.27"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.27/onwatch-darwin-arm64"
      sha256 "aaef6bded1cff2437079e58a462735f85029c23b250d7f5451233c440fca1e58"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.27/onwatch-darwin-amd64"
      sha256 "47fd2f320c6b1e30ca53deff4dfab7e04cbcedda95ae262bf7ef010ca861e42c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.27/onwatch-linux-arm64"
      sha256 "f05cd96f766694bd5d2a42b52c989bb5e9d9cc980f7e28ba5e03ba11cdabbd02"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.27/onwatch-linux-amd64"
      sha256 "be6d2499cd81b42c764e47306e7593dd61ec20750cd9c878c6a2db3567800df8"
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
