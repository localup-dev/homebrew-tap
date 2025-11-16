class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.0.1-beta24"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta24/localup-macos-arm64.tar.gz"
      sha256 "222745f09b418b396ed12344baf1f4d6054af5f5e555c98a839fc3ac6f31cab1"
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta24/localup-macos-amd64.tar.gz"
      sha256 "33a41649648b64ef8707bf0623dbf75af54e3804970a577f34aad214903869b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta24/localup-linux-arm64.tar.gz"
      sha256 "c60908efb2204641012110dc31ae5808ac7b6513e4edba656182ec25008201ff"
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta24/localup-linux-amd64.tar.gz"
      sha256 "bde98d1fd84095334be010a4b439d82140f9b9e3be1fd2116202e470fe99e32d"
    end
  end

  def install
    bin.install "localup"
  end

  test do
    system "#{bin}/localup", "--version"
  end
end
