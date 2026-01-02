class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.0.1-beta46"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta46/localup-macos-arm64.tar.gz"
      sha256 "748743de36dcec0096344610283d760ff9e8f9072c27c0c133e90fe2c470ab34"
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta46/localup-macos-amd64.tar.gz"
      sha256 "f4f78330f3b07f96a41f101cb28a4bc58b119326943680f9b50dbc9a9d0ad204"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta46/localup-linux-arm64.tar.gz"
      sha256 "7328b59fdbd23ad94bfe6c273c1656a3ed5b50884f86197875ae1c83029af432"
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta46/localup-linux-amd64.tar.gz"
      sha256 "04dd8ac397d1d2a1e699be174d07c901322d6bde0afa97e81e5d89af6b527b84"
    end
  end

  def install
    bin.install "localup"
  end

  test do
    system "#{bin}/localup", "--version"
  end
end
