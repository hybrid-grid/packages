#!/bin/bash
# Hybridgrid Installer
# One-line install: curl -fsSL https://raw.githubusercontent.com/hybrid-grid/homebrew-packages/main/install.sh | bash
#
# Environment variables:
#   VERSION      - Version to install (default: 0.1.0)
#   INSTALL_DIR  - Installation directory (default: /usr/local/bin)
#
# Examples:
#   curl -fsSL https://raw.githubusercontent.com/hybrid-grid/homebrew-packages/main/install.sh | bash
#   VERSION=0.1.0 curl -fsSL https://raw.githubusercontent.com/hybrid-grid/homebrew-packages/main/install.sh | bash
#   INSTALL_DIR=~/.local/bin curl -fsSL https://raw.githubusercontent.com/hybrid-grid/homebrew-packages/main/install.sh | bash

set -e

VERSION="${VERSION:-0.1.0}"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"

# Detect OS
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
case "$OS" in
  linux|darwin) ;;
  mingw*|msys*|cygwin*)
    echo "Error: This script is for Linux/macOS. For Windows, use Scoop:"
    echo "  scoop bucket add hybridgrid https://github.com/hybrid-grid/packages"
    echo "  scoop install hybridgrid"
    exit 1
    ;;
  *)
    echo "Error: Unsupported OS: $OS"
    exit 1
    ;;
esac

# Detect architecture
ARCH=$(uname -m)
case "$ARCH" in
  x86_64|amd64) ARCH="amd64" ;;
  aarch64|arm64) ARCH="arm64" ;;
  *)
    echo "Error: Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

URL="https://github.com/hybrid-grid/hybridgrid/releases/download/v${VERSION}/hybridgrid_${VERSION}_${OS}_${ARCH}.tar.gz"

echo "Installing hybridgrid v${VERSION} for ${OS}/${ARCH}..."
echo "Download URL: $URL"
echo "Install directory: $INSTALL_DIR"
echo ""

# Create install directory if needed
if ! mkdir -p "$INSTALL_DIR" 2>/dev/null; then
  if command -v sudo &> /dev/null; then
    SUDO="sudo"
    echo "Note: Using sudo to install to $INSTALL_DIR"
    $SUDO mkdir -p "$INSTALL_DIR"
  else
    echo "Error: Cannot create $INSTALL_DIR and sudo is not available"
    echo "Try: INSTALL_DIR=~/.local/bin $0"
    exit 1
  fi
else
  SUDO=""
fi

# Download and extract
echo "Downloading..."
curl -fsSL "$URL" | $SUDO tar -xzf - -C "$INSTALL_DIR" hg-coord hg-worker hgbuild

echo ""
echo "Successfully installed to $INSTALL_DIR:"
echo "  - hgbuild"
echo "  - hg-coord"
echo "  - hg-worker"
echo ""

# Verify installation
if command -v hgbuild &> /dev/null; then
  echo "Version: $(hgbuild version 2>/dev/null || echo 'unknown')"
else
  echo "Note: Add $INSTALL_DIR to your PATH to use the commands"
  echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
fi
