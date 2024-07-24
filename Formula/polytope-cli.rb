class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.29"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.29-macos-amd64.gz"
      sha256 "e189bdd34608d78bce7ee6649bf8d86f8094f65f95e74f6fb6a9f25dcf543f08"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.29-macos-arm64.gz"
      sha256 "31b84e9fddbfb5fd1c3cf4152f494b93c07fb9867d8aacee47e712ea5efd694e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.29-linux-amd64.gz"
      sha256 "0c7054d93e4791453696abada713f852134c9d91b042e1ce9181ceba93fe6d2c"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "polytope-cli-0.1.29-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/pt --version 2>&1"), "0.1.29-106cc9541-#{@@os}-#{@@arch}"
  end
end
