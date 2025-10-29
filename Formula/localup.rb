class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.0.1-beta7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta7/localup-macos-arm64.tar.gz"
      sha256 "031188822335c9529d39e8f146b90bed55aa6709165b368587403a9f6e33e4aa"
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta7/localup-macos-amd64.tar.gz"
      sha256 "1fa9725f054d0f6c1e113ec45970f486eb7f646b99b409f80591e6c094050bfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta7/localup-linux-arm64.tar.gz"
      sha256 "a6f795faf89a9012daefe160c1bb79919a37a1e33cc1e57de22504b62d9dfc1c"
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta7/localup-linux-amd64.tar.gz"
      sha256 "edfaa38a152fd1aa30f801dc0d0576ebe49292cbce5e947ff780f5eb42aab10a"
    end
  end

  def install
    bin.install "localup"
  end

  test do
    system "#{bin}/localup", "--version"
  end
end
