class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.11/sg-macos-amd64.tar.gz"
      sha256 "59bae1a19c892958ee97fcadd4b33faafa53149e22714bed2edc270a7f461c53"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.11/sg-macos-arm64.tar.gz"
      sha256 "9f2eaeb0b2ac1a977a99ebf60bed4c226b01a8381a4822c412b8406a77f78ea0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.11/sg-linux-amd64.tar.gz"
      sha256 "49492921b5430c0f7fbc520c16dccc8be1a3fa190855eeee50299230b6d8ddde"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.11/sg-linux-arm64.tar.gz"
      sha256 "5098d02d35b6cba5bd0231b1d6c44d2fb1bf34f8c38cf0417364f0c265b7ee9b"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
