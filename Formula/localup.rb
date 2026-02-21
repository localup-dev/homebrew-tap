class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.1.6/localup-macos-arm64.tar.gz"
      sha256 "deb6248b77081744482d33135c7fad3e4f0560186f83154b9fb0284344ed5e0d"
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.1.6/localup-macos-amd64.tar.gz"
      sha256 "b3cff7ec916d6e003ba65274951c17bd52a08b9392dba40b91cea3c76d559c5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.1.6/localup-linux-arm64.tar.gz"
      sha256 "4abf547120fe8d08de9d3a88a4876d6397d340b810141d9c4afea8d134c140d9"
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.1.6/localup-linux-amd64.tar.gz"
      sha256 "3bbbf5db7441f31da00635563965c2276ff05ff58300c16f38ec9ee0e4b71ad4"
    end
  end

  def install
    bin.install "localup"
  end

  test do
    system "#{bin}/localup", "--version"
  end
end
