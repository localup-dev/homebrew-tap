class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.0.1-beta7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta7/localup-macos-arm64.tar.gz"
      sha256 "226a3e524b8b8379118afc4bff31a37467713599225255165c29b3e5b7fd4e81"
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta7/localup-macos-amd64.tar.gz"
      sha256 "ca8ad85d60ada35f801581b5353ba2ae98c2b507c260d26bb721ec4fd0b3913f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta7/localup-linux-arm64.tar.gz"
      sha256 "15e54c32a6a394a5f4ceec982287c7d18bab9d00a7faae499ed64ad87c283fbc"
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta7/localup-linux-amd64.tar.gz"
      sha256 "ce83f33984592644acda6685b8bea332747fad731928dcb2daf75db5a7ee6a91"
    end
  end

  def install
    bin.install "localup"
  end

  test do
    system "#{bin}/localup", "--version"
  end
end
