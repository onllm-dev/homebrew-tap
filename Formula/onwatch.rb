class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.16"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.16/onwatch-darwin-arm64"
      sha256 "0971aef67a825659a4bf218c5250f7dd866b900368253d710254d3d5e8a8e38f"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.16/onwatch-darwin-amd64"
      sha256 "ea5654e8cdf19329d2b73979d45435a296207d2d4d7d813919716184a31a948c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.16/onwatch-linux-arm64"
      sha256 "18fafa7adbb1ac8888fdc72385d344f0b1d4ec668afb369cb7e85d03a6c5686c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.16/onwatch-linux-amd64"
      sha256 "2fdb763b494a17f3f079389a2c3cba1c7872626de4609ff56c5506262b5351ab"
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
