class Sage < Formula
  desc "Git workflow tool that simplifies complex Git operations"
  homepage "https://github.com/sage-scm/sage"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/sage-scm/sage/releases/download/v#{version}/sg-macos-amd64.tar.gz"
      sha256 "31ce984078061d4e3144e312c32018cba050914cca7a72d9838932f75aa56b0d"
    end

    on_arm do
      url "https://github.com/sage-scm/sage/releases/download/v#{version}/sg-macos-arm64.tar.gz"
      sha256 "cb245deb0eb2eefde09f453362dcf56f2f42171e35f468486fd2b371283282fa"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/sage-scm/sage/releases/download/v#{version}/sg-linux-amd64.tar.gz"
        sha256 "3aa0244f82b8a1ed28e38a799f0b5793e3a41aa017e900904ca75926749bdce4"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/sage-scm/sage/releases/download/v#{version}/sg-linux-arm64.tar.gz"
        sha256 "6cfc7d3a4e058a9e2d2568dee0a469db78f79ed9631542d8c692805dc1ba9c26"
      end
    end
  end

  def install
    bin.install "sg"
  end

  test do
    system "#{bin}/sg", "--version"
  end
end