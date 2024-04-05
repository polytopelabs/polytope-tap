class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.20"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.20-macos-amd64.xz"
      sha256 "b8d608021efbe6ea35b0c87569ffdec3f10402382ddb95e35b66ee67acf43d4d"
    elsif Hardware::CPU.arm?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.20-macos-arm64.xz"
      sha256 "f2c5d9a54020792e5b1211c1077521a41592e16b716ef260d116ec84229493eb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.20-linux-amd64.xz"
      sha256 "875e814906b67d3643aeb004f55ef9834dffbac421a9ffef289d8ff3e946d92f"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "pt-0.1.20-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/pt --version 2>&1"), "0.1.20-e5c165e13-#{@@os}-#{@@arch}"
  end
end
