class Sage < Formula
  desc "🌿 Sage — A Git workflow tool for managing branches and commits"
  homepage "https://github.com/sage-scm/sage"
  version "2025.10.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.10/sg-macos-amd64.tar.gz"
      sha256 "49db88bb91870b3cb440da1146f20626cdc4a8ec0356b0bd58b25ceb1e13391a"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.10/sg-macos-arm64.tar.gz"
      sha256 "0ec0e66bc0d5619e846341e47c294e520ce45b9f608f2e4f72e92ea4b9429bbf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/sage-scm/sage/releases/download/2025.10.10/sg-linux-amd64.tar.gz"
      sha256 "95d615b80433011091d559dbe8c15db5fcdb6b53eb8bd2ff39346cf8b8aec07d"
    else
      url "https://github.com/sage-scm/sage/releases/download/2025.10.10/sg-linux-arm64.tar.gz"
      sha256 "ff22ee72aa2507b432e4bd4647c7a37c3aec7968de7866f0aa5dd2eedad202c0"
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end
