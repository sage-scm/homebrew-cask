class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.12/sg-macos-amd64.tar.gz"
      sha256 "5aad25b419cb40db6c4de7298a33d8522d1a3bd00e5608a78467551483adab98"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.12/sg-macos-arm64.tar.gz"
      sha256 "95f2fb712a1775bd0729024bc74c167be73610ac7324d8e4d38701a6b29bbd2d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.12/sg-linux-amd64.tar.gz"
      sha256 "8fb8c2c0ef464b0f2256ad03834678d9614054bd86a997285475a04d2e5de86a"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.12/sg-linux-arm64.tar.gz"
      sha256 "4f8a2a02a5fc5df4d6e5b3aee2aadc86489208003508f81c51fcbf19d09c75a8"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
