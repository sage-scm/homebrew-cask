class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.3/sg-macos-amd64.tar.gz"
      sha256 "883d3cb6db10b5697620f8b6aebc1e64601aaa53197e13e3fd9eae90b0ce60ce"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.3/sg-macos-arm64.tar.gz"
      sha256 "32fbb24dd7951358b84785ac4ee7e30ca61d682c07edf9503f35e4e57d89c06c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.3/sg-linux-amd64.tar.gz"
      sha256 "c33e083d301d23999235a3973b7f424271966af4134e91d45ebf41631e439f74"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.3/sg-linux-arm64.tar.gz"
      sha256 "e9fa122e46cb1c9e41bd1a070b58c950ddead1933d2fea9c1a777450f1d72d83"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
