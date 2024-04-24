class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.27"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.27-macos-amd64.gz"
      sha256 "1c8c5ac33673d5bd1c0a48ad295ba47694b332d469e69ff3fd7ddc5a717bf4dc"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.27-macos-arm64.gz"
      sha256 "47c8e04f6a458bbc5dbeaeaa39e42b5300307c5692632648c5315832ddd04a7d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.27-linux-amd64.gz"
      sha256 "a3521999929aba6d973479d2dd9c6c930c670a2ca5c111ad30ab6e49edc03ad5"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "polytope-cli-0.1.27-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/pt --version 2>&1"), "0.1.27-8a5a2fad8-#{@@os}-#{@@arch}"
  end
end
