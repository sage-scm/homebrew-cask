class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.16/sg-macos-amd64.tar.gz"
      sha256 "fbb71b09e43a4c07d4ccaadac853bdd60e7100ea2c0184ec3b2f64a3e28b8fd5"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.16/sg-macos-arm64.tar.gz"
      sha256 "638a9350e465cd0a48d87e132caf802f89af0dcdbbac838205b87ed337421d4f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.16/sg-linux-amd64.tar.gz"
      sha256 "085be5f4867e595bf767dedd2054cf0836b68f26191fd81027cad44ca0a23233"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.16/sg-linux-arm64.tar.gz"
      sha256 "0de9be295aea11b30b1e76153416461bd1fccdf666bc1040144ab5fb3a4c4c75"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
