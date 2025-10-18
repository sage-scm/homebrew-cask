class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.18/sg-macos-amd64.tar.gz"
      sha256 "7e3727d955db44b9e661f07a14fdf5aa193524ea4475a0c91a7636236b797d60"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.18/sg-macos-arm64.tar.gz"
      sha256 "11afb3e1e5e22e04168f7c0239aa128ae168691ee78ea0aa3be0e50e09ab3c02"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.18/sg-linux-amd64.tar.gz"
      sha256 "efeca26e32eb2bde1c36296f6f7c2f2d507e410f7930994fc267cb36130cd8e1"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.18/sg-linux-arm64.tar.gz"
      sha256 "244416ce14b4cbb4eb23520b0b3242677352cefea1a2b5ee47f85f5af8a21c78"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
