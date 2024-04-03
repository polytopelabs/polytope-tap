class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.22"

  depends_on "xz" => :build

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.22-macos-amd64.xz"
      sha256 "d66d5656a5fd136f5fdbeb501da3a1cb77224ad018f9f1c49be6699d5d0defec"
    elsif Hardware::CPU.arm?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.22-macos-arm64.xz"
      sha256 "56b2332ae5baf43ce3cfd1d5916bf73cf03d29ddd9fd790387e5d5502a0bae07"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.22-linux-amd64.xz"
      sha256 "025f3fc8c5e9bf20636cb3ee9a3ea72a20b1c3a0074597cc3ee85351b442dfb7"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "pt-0.1.22-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/pt --version 2>&1"), "0.1.22-6fd267784-#{@@os}-#{@@arch}"
  end
end
