class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.0.1-beta13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-macos-arm64.tar.gz"
      sha256 "61d652e88d5293d8672f083bcf533759acc320235e145506fe4e3521dab51749"

      resource "agent-server" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-agent-server-macos-arm64.tar.gz"
        sha256 "71dd9addce4d5931bd840f744bd1ed19880f7fba66dd013efe049a57d1a05a1a"
      end

      resource "relay" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-relay-macos-arm64.tar.gz"
        sha256 "ef5681df9f4309051bbe450bbba1b446ac7a5f6be7eafd2fa10d798c8603faa4"
      end
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-macos-amd64.tar.gz"
      sha256 "84bcf1b6d01ee0913d47f611418b77d5bc26d637d5d4f4fd572360588882a02c"

      resource "agent-server" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-agent-server-macos-amd64.tar.gz"
        sha256 "b9aedf2cc8945cb93e7d0016c3e68f2d6a4fcbb0785d500a717b06c160747e14"
      end

      resource "relay" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-relay-macos-amd64.tar.gz"
        sha256 "811ff93aedafe69479ede9132170ea541b44362e84f5321c423667aa56f43364"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-linux-arm64.tar.gz"
      sha256 "cb326aa27fa6a317b36a70591a75f0325d952d5dbf1926123fab86f7802b1c73"

      resource "agent-server" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-agent-server-linux-arm64.tar.gz"
        sha256 "23a61d766ed477fda505e37319705a37dd4bcaff4a07484c180197e29c84e1f1"
      end

      resource "relay" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-relay-linux-arm64.tar.gz"
        sha256 "365133c3923a4d4e7ab0cb50c282943ee3c9f469d3abc42f0dcae183a7ac6064"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-linux-amd64.tar.gz"
      sha256 "7b7d1655d02cefff5ef9c6db35b8264f020f9d074bb261d3063f06346049634f"

      resource "agent-server" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-agent-server-linux-amd64.tar.gz"
        sha256 "8f2cf5c6e38a66850fdd262d1c846a1fcc9e59f4a4313fa6863627033c983121"
      end

      resource "relay" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta13/localup-relay-linux-amd64.tar.gz"
        sha256 "2a617d5cdac8cf5f43e3729d80c72d0118ff6e3bd9020ae4a0642a907476c362"
      end
    end
  end

  def install
    bin.install "localup"

    # Install agent-server from resource
    agent_server_archive = resource("agent-server").cached_download
    if agent_server_archive.to_s.end_with?(".zip")
      system "unzip", "-q", agent_server_archive, "-d", buildpath
    else
      system "tar", "-xzf", agent_server_archive, "-C", buildpath
    end
    bin.install buildpath/"localup-agent-server"

    # Install relay from resource
    relay_archive = resource("relay").cached_download
    if relay_archive.to_s.end_with?(".zip")
      system "unzip", "-q", relay_archive, "-d", buildpath
    else
      system "tar", "-xzf", relay_archive, "-C", buildpath
    end
    bin.install buildpath/"localup-relay"
  end

  test do
    system "#{bin}/localup", "--version"
    system "#{bin}/localup-agent-server", "--version"
    system "#{bin}/localup-relay", "--version"
  end
end
