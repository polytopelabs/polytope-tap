class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.27"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.27-macos-amd64.gz"
      sha256 "d7ca04604da3a07403b2cd5deaf02dcea439e219d6db16e4252c3117e458209b"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.27-macos-arm64.gz"
      sha256 "8573aa08210eb137bc54204e67c6f745c5b8c9879f9dce7f15f0a05803903adb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.27-linux-amd64.gz"
      sha256 "3df71ea60b5ffd28bae516b6c6eb25c5ee682d4a1119fa53171b55d5bc94f5cf"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "polytope-cli-0.1.27-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/pt --version 2>&1"), "0.1.27-74e69fc9b-#{@@os}-#{@@arch}"
  end
end
