class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.31"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.31-macos-amd64.gz"
      sha256 "727f382c7f76c2fb6529b0cde0bdf4e9c96e25086df911f0baa75a5c42a10bea"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.31-macos-arm64.gz"
      sha256 "1e2f13ac4cbf89cebe892d3434a892b7230b8877b054ca1383728d68e00a2dfd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.31-linux-amd64.gz"
      sha256 "5d888bfa4533ceac22a6ad59b8297c95480c17997da129de301ad271bedffc0c"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "polytope-cli-0.1.31-#{@@os}-#{@@arch}" => "polytope"
    bin.install_symlink "polytope" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/polytope --version 2>&1"), "0.1.31-bae4935de-#{@@os}-#{@@arch}"
  end
end
