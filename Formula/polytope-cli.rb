class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.26"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.26-macos-amd64.bz2"
      sha256 "4b04e30c34f67e27c4d65892d4b3409758a1c55268b44763259dfab346651636"
    elsif Hardware::CPU.arm?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.26-macos-arm64.bz2"
      sha256 "d72e761fef7bd6daa78dcece4c928a1a42273c19854135eb4e21f19cddcf5e47"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.26-linux-amd64.bz2"
      sha256 "16ef83dce7e221b1feb3296acea7d3ce01aed5c0cf9aae89f368328130e4ba50"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "pt-0.1.26-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/pt --version 2>&1"), "0.1.26-73f1b2a35-#{@@os}-#{@@arch}"
  end
end
