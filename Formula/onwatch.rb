class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.11.33"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.33/onwatch-darwin-arm64"
      sha256 "2875b1ce47e36d944a385a60aaa0efa083880a838b8df62a1ed2bd307c2ce4a1"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.33/onwatch-darwin-amd64"
      sha256 "147328ac21b76e8c55c714aa7adcc61c7646724e3f436351799eb59da16cdbeb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.33/onwatch-linux-arm64"
      sha256 "e59c9cb4d638ae8f9424071d1f22c12f616cd57177728e3f723415b742f09aef"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.11.33/onwatch-linux-amd64"
      sha256 "431e8ff8f5ed4c9fe3cc9b5bfe94ccdb7a6001b3d7f99fdfb403c04c59dc4a24"
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
