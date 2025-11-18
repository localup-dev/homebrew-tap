class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.0.1-beta25"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta25/localup-macos-arm64.tar.gz"
      sha256 "d7857cd4c866c279c749966cff78b592d1944ef104f30f3ec79ea46cbb589ef2"
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta25/localup-macos-amd64.tar.gz"
      sha256 "568dab82686c0217ccf2e986604dcc592bb14e82645a6931d966357ac63bae13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta25/localup-linux-arm64.tar.gz"
      sha256 "388253c52544cdf6e1a23826508f920ef8266dd3196a2d6f92b61f95ea72cfcb"
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta25/localup-linux-amd64.tar.gz"
      sha256 "81d1cdf0a155a4d30326f89992bec690e7e754f818701921cf9e1b39e781cc20"
    end
  end

  def install
    bin.install "localup"
  end

  test do
    system "#{bin}/localup", "--version"
  end
end
