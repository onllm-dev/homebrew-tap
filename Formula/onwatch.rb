class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.13.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.0/onwatch-darwin-arm64"
      sha256 "7cfc0216e93409991a9ee18b4c40a458e02c08316c876c9c313fa69d547198ce"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.0/onwatch-darwin-amd64"
      sha256 "e1c70e0d602a6890f7b1b5dd763689fce52f8b92b647605d0aaf75c6636a64a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.0/onwatch-linux-arm64"
      sha256 "4f748d49d66e631d4575334d43eda515285c378d9e26e01987db4bb4adf6e412"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.0/onwatch-linux-amd64"
      sha256 "cd6095dea590b150af81b723061a32ee95d65b20c13082737ae1127424d882f7"
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
