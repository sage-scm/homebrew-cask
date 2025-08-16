class Sage < Formula
  desc "Git workflow tool that simplifies complex Git operations"
  homepage "https://github.com/sage-scm/sage"
  url "https://github.com/sage-scm/sage/archive/refs/tags/v0.1.0.tar.gz"
  sha256 ""
  license "MIT"
  head "https://github.com/sage-scm/sage.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "bins/sage-cli")
  end

  test do
    system "#{bin}/sg", "--version"
  end
end