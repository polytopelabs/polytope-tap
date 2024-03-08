class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.19"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.19-macos-amd64.xz"
      sha256 "fbcf8413394b5b778a919ffa179eeabf162f3ba17ca644aa18e2b5bad42d4cd3"
    elsif Hardware::CPU.arm?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.19-macos-arm64.xz"
      sha256 "af55157bc1e87f8c62836aa4d94983651ba8e363a3c5328e5a7bf411d1039cdd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-0.1.19-linux-amd64.xz"
      sha256 "05cc9b58e00b25c423af0ec0cc5a881fcec37896fc01b1ff48d9730488f3dc95"
    elsif Hardware::CPU.arm?
      odie "We don't provide ARM builds on Linux yet – please let us know if you want this!"
    end
  end

  def install
    bin.install "pt-0.1.19-#{@@os}-#{@@arch}" => "pt"
  end

  test do
    assert_match "0.1.19-42c86a4ec-#{@@os}-#{@@arch}", shell_output("#{bin}/pt --version")
  end
end
