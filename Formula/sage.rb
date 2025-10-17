class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.17/sg-macos-amd64.tar.gz"
      sha256 "1d74f156d6bd74c38b67772f785a9208475bdaaf4f62f570679014cf78ac4878"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.17/sg-macos-arm64.tar.gz"
      sha256 "ff9883e2bc0acc74e36f4cc62ae0b0e8c82669d0a059068975ed16f62f31f29c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.17/sg-linux-amd64.tar.gz"
      sha256 "169b1bccbc98585467745f6ae2491e0a3b6710501aed34fde5d32e0bac2d489d"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.17/sg-linux-arm64.tar.gz"
      sha256 "7242ab504be4aa75e9f2efe108e63aef5f8fd638507d94e3293d8de94a7b0b86"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
