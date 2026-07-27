class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.13.3"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.3/onwatch-darwin-arm64"
      sha256 "7cfcd3607c41462c1bf5f3bab96eb99463e5d89129519bf50d99795ab9292803"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.3/onwatch-darwin-amd64"
      sha256 "6c7e38f8e336095587412472813e54a34a7c0619f9c20bc3b5779b49adb4f19e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.3/onwatch-linux-arm64"
      sha256 "c2f8534a97d8eb4aa085b6ca085549122bfea47a5336d82da3661f20a4b2378a"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.3/onwatch-linux-amd64"
      sha256 "254553749d672aa08434754f7e74a65fbba4fdaa8776a8b882d5a8616508845b"
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
