class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.14/sg-macos-amd64.tar.gz"
      sha256 "6b3bb2024f3b4541a21bd0ff90c70aee3bb142f857e73476b0e25c87d7d083e1"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.14/sg-macos-arm64.tar.gz"
      sha256 "ba3701a83a23cc4d86e2bb733372c187e89fb88fdbadb462260bfc32faeb99a6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.14/sg-linux-amd64.tar.gz"
      sha256 "b8f45c78a4fca65f4a61e81b834564f09bbde9df0be27c658eb14f74bd597494"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.14/sg-linux-arm64.tar.gz"
      sha256 "23cae1601dbf3225005e945c536f5ec48ffb69d7000638bc2ab39c34d503aec6"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
