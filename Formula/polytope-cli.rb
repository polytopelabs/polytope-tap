class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.32"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.32-macos-amd64.gz"
      sha256 "1def4c5f9857ea91f23d68f48ea8f928378027bb0c5e291af5d36f03640dca5e"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.32-macos-arm64.gz"
      sha256 "f2d1f1e7164b3fee9ca060962d65bbfe5dd3ed8e34f65ebb8670fcb037b13e1a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.32-linux-amd64.gz"
      sha256 "cf76fce69f4f2a43a266127809711b4a3eb61c6cdef90baa4aa5311b8c3cb948"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.32-linux-arm64.gz"
      sha256 "cd4ff8edd334ef3dc66b9af0bcc1ce0ff551896b1aa6dd0f45a0df6ba3d65a76"
    end
  end

  def install
    bin.install "polytope-cli-0.1.32-#{@@os}-#{@@arch}" => "polytope"
    bin.install_symlink "polytope" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/polytope --version 2>&1"), "0.1.32-faa794d19-#{@@os}-#{@@arch}"
  end
end
