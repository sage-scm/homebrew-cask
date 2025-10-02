class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.2002"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.2002/sg-macos-amd64.tar.gz"
      sha256 "09c87adcee11d67eaf8fcc711e080bfba127ac6ff2124aedf961c00637cce2e5"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.2002/sg-macos-arm64.tar.gz"
      sha256 "032b8ffc4c6d7d25f185ef619ec01d4eba231e1c9208d04e8fcbb73b81aaf808"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.2002/sg-linux-amd64.tar.gz"
      sha256 "86a6c5463bcbd8a4c5782915bf6bdf600c9704156ec9140323ca814103dea715"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.2002/sg-linux-arm64.tar.gz"
      sha256 "806d0697ce3edf7a56616faffebea16cf483caeb07674f90edd2b4f7674f2bcc"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
