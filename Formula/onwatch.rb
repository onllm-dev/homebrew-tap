class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.28"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-darwin-arm64"
      sha256 "f4f0ac9453289948512d633693515138ccbf9fb96484f75b165639405a3bbd20"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-darwin-amd64"
      sha256 "e725cf00545733b284d538e94630b7eec9ad89982db781721a899f8b26a44c7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-linux-arm64"
      sha256 "7b535b8a805cf9801393828bb06311f790bdf7f200354e96929b708da8502285"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.28/onwatch-linux-amd64"
      sha256 "cb4a502d93fa0dc53359ff62a0f51a60d26e873373e231f305fdb4ce78f10df0"
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
