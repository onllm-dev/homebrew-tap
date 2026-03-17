class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.24"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.24/onwatch-darwin-arm64"
      sha256 "3bd7aa2647e8fbbe3befd297d2efc925afa352be457145105668454538cec70c"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.24/onwatch-darwin-amd64"
      sha256 "40dc4362138271b08c8d9aa7cba8641ee8a15439a04c53308dd856f1e09db94e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.24/onwatch-linux-arm64"
      sha256 "c48abd326b903270b6f0680154c39fcaf4cf1d74ba3fab7e72c9b7c026e3be59"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.24/onwatch-linux-amd64"
      sha256 "98c36cfe4cbbb1b5dc635ecf555aae1b080b8c17830d1f2a97339b63ef3c401b"
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
