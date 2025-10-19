class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.19/sg-macos-amd64.tar.gz"
      sha256 "8ff37e90c730a3e36ed375c597d37c51170c1f5ac5f9a6d28d6167916a0edbda"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.19/sg-macos-arm64.tar.gz"
      sha256 "a5d66750780e9cf729272c1101863a81b042420d418ed6fa53dd3d444af40263"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.19/sg-linux-amd64.tar.gz"
      sha256 "a8c47a7de6ad5865f7fe70ce3f820518bb9560c5be72122c8374e3cd01b65d6a"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.19/sg-linux-arm64.tar.gz"
      sha256 "9156a02221fde602a890bc3901d2f0caa5b3820e137a2f6547f680a8ecc4d93f"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
