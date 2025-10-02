class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.2001"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.2001/sg-macos-amd64.tar.gz"
      sha256 "b61a04a4333161ae7d273e3e756aded257cf390b01e7bd0a14b0746478962e8f"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.2001/sg-macos-arm64.tar.gz"
      sha256 "07ad21166076522516758ca7d694681b3b6bc7dd3c7506e148c58e3e067e7eb8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.2001/sg-linux-amd64.tar.gz"
      sha256 "aca606ffd5efc4db23cde80fe0186697781daefd1fad609018faa7ad0985471c"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.2001/sg-linux-arm64.tar.gz"
      sha256 "5b8172d201994a7fcd8cac54dc3b153b4d9c31680cc61d6e3d7515bdff73fb2e"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
