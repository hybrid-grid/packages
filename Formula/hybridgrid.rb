# typed: false
# frozen_string_literal: true

# This formula is auto-updated by GoReleaser
class Hybridgrid < Formula
  desc "Distributed multi-platform build system"
  homepage "https://github.com/hybrid-grid/hybridgrid"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/hybrid-grid/hybridgrid/releases/download/v0.1.0/hybridgrid_0.1.0_darwin_amd64.tar.gz"
      sha256 "fc299047aa717f1ee3fb82cf2fbc1b1e3047a628d6c11c1b0a1c20d7fd1dae1e"
    end
    on_arm do
      url "https://github.com/hybrid-grid/hybridgrid/releases/download/v0.1.0/hybridgrid_0.1.0_darwin_arm64.tar.gz"
      sha256 "ef09cad4169ab21429c8badf52f44e92f59c8922cb04c1d7c8947533a2eb34d1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hybrid-grid/hybridgrid/releases/download/v0.1.0/hybridgrid_0.1.0_linux_amd64.tar.gz"
      sha256 "46fda3827cc255384096ddeba5d461f0e1643f7e4d51d0be39cca17a90d3fe56"
    end
    on_arm do
      url "https://github.com/hybrid-grid/hybridgrid/releases/download/v0.1.0/hybridgrid_0.1.0_linux_arm64.tar.gz"
      sha256 "3c63007fc373d8556c0a845366bd0e16eee837225bbca5d2b64274c3257d8773"
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
