class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.1.4/localup-macos-arm64.tar.gz"
      sha256 "a4abc16e34e51799a70440c0f1c953a3c99515b0145355bb88cc5f09f8059c78"
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.1.4/localup-macos-amd64.tar.gz"
      sha256 "e1a2f3528cf76ffdb350cc2dc471ce787f5411c6beeb651bb34c598a0121b210"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.1.4/localup-linux-arm64.tar.gz"
      sha256 "753b0af2caa1b68982491ad931bb8a2ae3fc27344c30d55ddb8deb67f92d7bac"
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.1.4/localup-linux-amd64.tar.gz"
      sha256 "c578370a611371fa3ca72782616322213d6dd8559a07a5651ed17e0f9294ed4f"
    end
  end

  def install
    bin.install "localup"
  end

  test do
    system "#{bin}/localup", "--version"
  end
end
