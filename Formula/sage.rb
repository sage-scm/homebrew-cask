class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.9/sg-macos-amd64.tar.gz"
      sha256 "344e192fd701cbfdec1ab49a7ad3f917f2448ff7c0ebcd8c72c5954f1e198d26"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.9/sg-macos-arm64.tar.gz"
      sha256 "58c18474c82426d6db84ada8f0472b0a7ff275fc19822285777a1b7c175c4253"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.9/sg-linux-amd64.tar.gz"
      sha256 "cd4504720d34b833d7a6a78d7a33361c656eaca0abe9c0a3689f4a28c5b64aae"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.9/sg-linux-arm64.tar.gz"
      sha256 "c9e66d320ec975ab30b8bacbe949ee3947548dfb252b1a75620fc70dcca23627"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
