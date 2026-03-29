class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.32"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.32/onwatch-darwin-arm64"
      sha256 "3f8435540f9cf06977e0bd118d373028d24900fdb1c999893245a8d6971cd8cf"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.32/onwatch-darwin-amd64"
      sha256 "6590ba46f6371e83c157e29b12c0170d711ebb0c7262271528f5aadee9626898"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.32/onwatch-linux-arm64"
      sha256 "d1e2fbaf8513a8c06a9caeb5a9731a1fb0d0118f87a81cd90aee0e9101cd1bb2"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.32/onwatch-linux-amd64"
      sha256 "6c76009d2563afe75f316e291c656ff423f235aab9a4eece7b1101696ff602b7"
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
