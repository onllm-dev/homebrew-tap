class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.6"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.6/onwatch-darwin-arm64"
      sha256 "c1d37ac0584aea540db8f7c43d3e162accb91b458c12a8d96abc4f740886b081"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.6/onwatch-darwin-amd64"
      sha256 "6d10035aee9933cc903f7556acd32963393cbb835af5d869c47ac557996062a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.6/onwatch-linux-arm64"
      sha256 "36683cea5db9c9920f361d6afb6934ca068144112d9f5746362341d70784b280"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.6/onwatch-linux-amd64"
      sha256 "b640e88171ca1cd9862ab44e6ee078936f761d7ea737141e28cd3c34bc897381"
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
