class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.15"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.15/onwatch-darwin-arm64"
      sha256 "10ae05a825eec814c54e32089e3bc2104e4f23adc170901af3988751dd9254b9"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.15/onwatch-darwin-amd64"
      sha256 "fb864708e309ec072b50f149122a3b8fd1964035be30fd965f84574e2800ddd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.15/onwatch-linux-arm64"
      sha256 "2bf5dc3e436c330dd5a7c0c3c9d04b0e86aa8128b3b6f3b69191da41b1b9adcc"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.15/onwatch-linux-amd64"
      sha256 "a53be9f4cb2031e762bc99891c1f3354a5c94f557515c27258d2e73944a17341"
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
