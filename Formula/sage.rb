class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.4/sg-macos-amd64.tar.gz"
      sha256 "f76fd22f3fb02f425aad4419dcbedd3e2c555570c874c8167e76fd4cf55c2403"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.4/sg-macos-arm64.tar.gz"
      sha256 "bab0e0d36b86befe10b4071423411192954ed979dcb411a4ade316c291ed2212"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.4/sg-linux-amd64.tar.gz"
      sha256 "9af3f71958bbdfcf67a17ae3798a09a74013450794ce1d2364c98eb42bab8a09"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.4/sg-linux-arm64.tar.gz"
      sha256 "1802b82f0bd25a4c9db0c0eb40572efe4987ac79b4f7bc751977599987b8875b"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
