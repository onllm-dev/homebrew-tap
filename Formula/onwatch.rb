class Onwatch < Formula
  desc "CLI tool for tracking AI API quotas across multiple providers"
  homepage "https://github.com/onllm-dev/onwatch"
  version "2.13.5"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.5/onwatch-darwin-arm64"
      sha256 "c0573229d8f45cab2ecabe6bbe5912443acc7d5d19b11511190465616ef2c823"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.5/onwatch-darwin-amd64"
      sha256 "e1632f9d042f289c2c19a1d92962f264d1d924ca9204e96ef8e5d3648d47ae89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.5/onwatch-linux-arm64"
      sha256 "b568779f4a5311453d61f38016e9373fcd4e96506103b23004f789f6f61e6f69"
    else
      url "https://github.com/onllm-dev/onwatch/releases/download/v2.13.5/onwatch-linux-amd64"
      sha256 "d5e1f133436fcd2a9b0cc09888976c5b6dab00f262018efe36c971fd6a34859c"
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
