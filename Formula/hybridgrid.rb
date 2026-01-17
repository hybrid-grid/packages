# typed: false
# frozen_string_literal: true

# This formula is auto-updated by GoReleaser
# Manual changes may be overwritten on the next release
class Hybridgrid < Formula
  desc "Distributed multi-platform build system"
  homepage "https://github.com/hybrid-grid/hybridgrid"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hybrid-grid/hybridgrid/releases/download/v0.1.0/hybridgrid_0.1.0_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_DARWIN_AMD64"
    end
    on_arm do
      url "https://github.com/hybrid-grid/hybridgrid/releases/download/v0.1.0/hybridgrid_0.1.0_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hybrid-grid/hybridgrid/releases/download/v0.1.0/hybridgrid_0.1.0_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_AMD64"
    end
    on_arm do
      url "https://github.com/hybrid-grid/hybridgrid/releases/download/v0.1.0/hybridgrid_0.1.0_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    end
  end

  def install
    bin.install "hg-coord"
    bin.install "hg-worker"
    bin.install "hgbuild"
  end

  test do
    system "#{bin}/hgbuild", "version"
  end
end
