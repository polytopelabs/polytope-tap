class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.28"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.28-macos-amd64.gz"
      sha256 "d0cfe2c3b77ad3514d33a0a44790c59f031813af08cac615dda5c4c6e7fbc91d"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.28-macos-arm64.gz"
      sha256 "1be55ceab0c01d40459deb46503c5e9126274d9563936a2e09033742c9e27a82"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.28-linux-amd64.gz"
      sha256 "716bf2e7e97af4c7a8c9b31f517f3e72ef678fa912fe51e36582f5cf43338aca"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "polytope-cli-0.1.28-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/pt --version 2>&1"), "0.1.28-eb6cc5bcb-#{@@os}-#{@@arch}"
  end
end
