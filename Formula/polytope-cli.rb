class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.25"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.25-macos-amd64"
      sha256 "889b0d0beec140431456e42f2b509c85c3f12937a8179d5c788c1e56ed4617f3"
    elsif Hardware::CPU.arm?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.25-macos-arm64"
      sha256 "835fb40e54ae5c6050217f2d2735c0f6f8eb170a3281296397dfb136e8f971e5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.25-linux-amd64"
      sha256 "0b663f397a68bcb8b555aa55efaa81a9fc1022957170f8309627e336d3d17427"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "pt-0.1.25-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/pt --version 2>&1"), "0.1.25-175d8bdd6-#{@@os}-#{@@arch}"
  end
end
