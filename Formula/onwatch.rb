class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.46"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.46/onwatch-darwin-arm64"
      sha256 "4a4ca92c7819dbe4f2ee74617c0643199a293ea3809c2ce4029e8558253f2fb3"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.46/onwatch-darwin-amd64"
      sha256 "90b16fae64183104376e2524930ee08b145bd39fa4c084e09cfdac9b13c5cb1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.46/onwatch-linux-arm64"
      sha256 "749d17a5e27da6c9e45c7c26dfa0e401ced658d7df790cfa8fed163b723da823"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.46/onwatch-linux-amd64"
      sha256 "b1b54d7138e249fb2260795b2e8e8bb86e468e94d5f6ea544a1f75e045218c1b"
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
