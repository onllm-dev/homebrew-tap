class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.14.3"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.3/onwatch-darwin-arm64"
      sha256 "326ae5bdc9c8b4117f39bae9b54098a6d1f7c72ba996e7949b977067d0e0c009"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.3/onwatch-darwin-amd64"
      sha256 "7be2e97164d94ce49431e5dfe7112a704ab1f5b244de8950f800015fbe086c78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.3/onwatch-linux-arm64"
      sha256 "12da03f1eebbe8542e6182dfc3386158764b749033733d4fc6332f41f9f36563"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.14.3/onwatch-linux-amd64"
      sha256 "34b6da74d0ab1b45b6c9099a35bb071f61d20b2f34a4ed666d86970c909b7a46"
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
