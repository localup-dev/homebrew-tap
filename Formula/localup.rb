class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.0.1-beta40"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta40/localup-macos-arm64.tar.gz"
      sha256 "19f816a5f1d628e2159b721dc5187aedfe709fa91d321cdd0b03d3979f3c43f2"
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta40/localup-macos-amd64.tar.gz"
      sha256 "a1814c5fc76e853298403780f72633bc3f698875e204d3f6fb525ab852dbf41e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta40/localup-linux-arm64.tar.gz"
      sha256 "61a50229b208007f81b9328ae7d5e4209a4c1282c5b3cc8e9a958c82b13d2a2e"
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta40/localup-linux-amd64.tar.gz"
      sha256 "bbbf4b3c319e55fa67d24d49da4ee82d478c5f2a6d692b8db7cba07bd4bb9d90"
    end
  end

  def install
    bin.install "localup"
  end

  test do
    system "#{bin}/localup", "--version"
  end
end
