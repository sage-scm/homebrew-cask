#!/bin/bash

set -e

REPO="sage-scm/sage"
FORMULA_FILE="Formula/sage.rb"

echo "Fetching latest release info..."
LATEST_RELEASE=$(curl -s "https://api.github.com/repos/$REPO/releases/latest")
VERSION=$(echo "$LATEST_RELEASE" | grep '"tag_name"' | sed -E 's/.*"v?([^"]+)".*/\1/')

if [ -z "$VERSION" ]; then
    echo "Error: Could not determine latest version"
    exit 1
fi

echo "Latest version: $VERSION"

get_sha256() {
    local platform=$1
    local url="https://github.com/$REPO/releases/download/v$VERSION/sg-$platform.tar.gz.sha256"
    local sha_content=$(curl -sL "$url")
    echo "$sha_content" | cut -d' ' -f1
}

echo "Fetching SHA256 checksums..."
MACOS_AMD64_SHA=$(get_sha256 "macos-amd64")
MACOS_ARM64_SHA=$(get_sha256 "macos-arm64")
LINUX_AMD64_SHA=$(get_sha256 "linux-amd64")
LINUX_ARM64_SHA=$(get_sha256 "linux-arm64")

echo "Generating formula..."
cat > "$FORMULA_FILE" << EOF
class Sage < Formula
  desc "Git workflow tool that simplifies complex Git operations"
  homepage "https://github.com/sage-scm/sage"
  version "$VERSION"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/sage-scm/sage/releases/download/v#{version}/sg-macos-amd64.tar.gz"
      sha256 "$MACOS_AMD64_SHA"
    end

    on_arm do
      url "https://github.com/sage-scm/sage/releases/download/v#{version}/sg-macos-arm64.tar.gz"
      sha256 "$MACOS_ARM64_SHA"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/sage-scm/sage/releases/download/v#{version}/sg-linux-amd64.tar.gz"
        sha256 "$LINUX_AMD64_SHA"
      end
    end

    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/sage-scm/sage/releases/download/v#{version}/sg-linux-arm64.tar.gz"
        sha256 "$LINUX_ARM64_SHA"
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
EOF

echo "Formula updated successfully for version $VERSION"
echo ""
echo "SHA256 Checksums:"
echo "  macOS AMD64: $MACOS_AMD64_SHA"
echo "  macOS ARM64: $MACOS_ARM64_SHA"
echo "  Linux AMD64: $LINUX_AMD64_SHA"
echo "  Linux ARM64: $LINUX_ARM64_SHA"