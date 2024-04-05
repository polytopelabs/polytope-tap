class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.23"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.23-macos-amd64.bz2"
      sha256 "ec974ff87b8805f4b25fbbc7d252311971f5fbb29d96d8d807c70ed3032635fa"
    elsif Hardware::CPU.arm?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.23-macos-arm64.bz2"
      sha256 "c154010249bf15c78698b473f1eae34fbc36f4ad876696e42960d49567e2a61b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.23-linux-amd64.bz2"
      sha256 "07c4380bf3880204c46e209d7abf0701e315e8d028d36e4eaf01975993e57ebf"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "pt-0.1.23-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/pt --version 2>&1"), "0.1.23-67b5119be-#{@@os}-#{@@arch}"
  end
end
