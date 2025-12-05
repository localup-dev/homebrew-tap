class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.0.1-beta35"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta35/localup-macos-arm64.tar.gz"
      sha256 "769627aa74fa573757cac39efc8ecd25525d1eb09318265d871a8c9f806310ea"
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta35/localup-macos-amd64.tar.gz"
      sha256 "7fc3d0adb51ca7e0effe0e0b1bc80b0df9e1b4d38700280e38862b33bbd67c43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta35/localup-linux-arm64.tar.gz"
      sha256 "a442fa99cab6b20e8ff255fd6530a17f3bd55a9ece16fdd92043cfbad342b026"
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta35/localup-linux-amd64.tar.gz"
      sha256 "9e92d2785cd462635afffe7ec6f239bee411acd7f94f838f51ab1c7d2dc74336"
    end
  end

  def install
    bin.install "localup"
  end

  test do
    system "#{bin}/localup", "--version"
  end
end
