class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.13/sg-macos-amd64.tar.gz"
      sha256 "83f87379b32fae7fb26421553d1060cbad18d55f971ae0a4513fd82a008ee106"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.13/sg-macos-arm64.tar.gz"
      sha256 "130be331f58d2b0a09d3fa0c6c40fa0ae5be9fda72bb9363e9aa230c0a9232e8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.13/sg-linux-amd64.tar.gz"
      sha256 "7cd1a94d95c460fe9ceb78eff8ef2329aa53276b38cc1b2086191b6343e80809"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.13/sg-linux-arm64.tar.gz"
      sha256 "74122e30c996ff11caa455e619e95531829699dbeae40ba79639072e504703e8"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
