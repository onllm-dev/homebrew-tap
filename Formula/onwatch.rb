class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.12.2"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.2/onwatch-darwin-arm64"
      sha256 "b274867c3df52a4d36169757948e74f4d92564fa29a180827b4d0274ac0a94f1"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.2/onwatch-darwin-amd64"
      sha256 "f3ce54c2e569d5f97613d55d993d280c5d23e387b9d94a8c1f15a87fe5454372"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.2/onwatch-linux-arm64"
      sha256 "934cdf46b329e4bf7f0f6d233f1a269cc046ce0d0e839af977af540f636d9687"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.12.2/onwatch-linux-amd64"
      sha256 "f7744a644784a58ffd6d434dd30cf880be403f9487aec5f52329421390d5a057"
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
