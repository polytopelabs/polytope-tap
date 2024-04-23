class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.26"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.26-macos-amd64.gz"
      sha256 "2e506fef9c72936d28a23209a936195224c691f7d2efee1af3f4cbd8e38b5999"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.26-macos-arm64.gz"
      sha256 "ae66b1219d2a0cf76cc2c21ba06d59fca2f9cb6cf637d37583c77104426ae3ce"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.26-linux-amd64.gz"
      sha256 "17a4554f48c4b39213c02df364048dbbd817a55f72b15034f9c266f9240d058b"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "polytope-cli-0.1.26-73f1b2a35-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/pt --version 2>&1"), "0.1.26-73f1b2a35-#{@@os}-#{@@arch}"
  end
end
