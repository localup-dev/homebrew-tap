class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.0.1-beta68"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta68/localup-macos-arm64.tar.gz"
      sha256 "c3d208d177f7fb83ad322d40ba1f0f3b0b22e24e51664984483eae127cabab0a"
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta68/localup-macos-amd64.tar.gz"
      sha256 "d9ff0fa4de1ae1184bd339fb84585f3ce1cd1bff898add84e67892a15e28182c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta68/localup-linux-arm64.tar.gz"
      sha256 "8c5eaa0c02c041d0e6107e8b36adebd7daa21ea8acce5c6f6e8a6c6790ec3d49"
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta68/localup-linux-amd64.tar.gz"
      sha256 "2cf34bd0b31c92d21aa4c9bd82979b5b5afa4cb0e2566a714511051a84ad3069"
    end
  end

  def install
    bin.install "localup"
  end

  test do
    system "#{bin}/localup", "--version"
  end
end
