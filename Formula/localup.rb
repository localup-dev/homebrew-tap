class Localup < Formula
  desc "LocalUp - Local development environment setup and management"
  homepage "https://github.com/localup-dev/localup"
  version "0.0.1-beta14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-macos-arm64.tar.gz"
      sha256 "b18df507d960ceee17c2be12a10a385c9a48b36e326cf6366cd809cd74947980"

      resource "agent-server" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-agent-server-macos-arm64.tar.gz"
        sha256 "181889482f3f4b33d86240ab6962a1530f921c7ba280329eb578710b6a7de465"
      end

      resource "relay" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-relay-macos-arm64.tar.gz"
        sha256 "d94d4d91a2daa42b080cc33651e8fbdc36b6b9051328baeabec352093f489d3c"
      end
    else
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-macos-amd64.tar.gz"
      sha256 "6f20b7efcb5dc3445375f09ec76c457a3e4433eb738e816576ed27521bb128dc"

      resource "agent-server" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-agent-server-macos-amd64.tar.gz"
        sha256 "76a921c62ab52de0a1dae68efbd0934d8b93ffb1233ca789d2aea0e94dea84b9"
      end

      resource "relay" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-relay-macos-amd64.tar.gz"
        sha256 "c857a025a7676075e6ab27f0edec2d27cc83cb4286424309f240404b03af32d3"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-linux-arm64.tar.gz"
      sha256 "cc1678cfb406e0d98520d4343466f311716256e7bb7ca4286edcfff06791951e"

      resource "agent-server" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-agent-server-linux-arm64.tar.gz"
        sha256 "9da4dc9462aaa086bb612e1adca5a79a4b6914cdc7f302e9135b72d54475b332"
      end

      resource "relay" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-relay-linux-arm64.tar.gz"
        sha256 "cbedd3da20e825a3ac3f6fc22bf388d9ed680af87f41bee5677236951d785d2c"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-linux-amd64.tar.gz"
      sha256 "13bb77cf0736a492cab0dd2a7e0183be41e93db91c24bd668b247b7a62c47d07"

      resource "agent-server" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-agent-server-linux-amd64.tar.gz"
        sha256 "eb0e3b4f1b2e3c8f1f9de4cd16b5427f8fd29a0979cfb631af31f27c20a8097a"
      end

      resource "relay" do
        url "https://github.com/localup-dev/localup/releases/download/v0.0.1-beta14/localup-relay-linux-amd64.tar.gz"
        sha256 "54f5cb618d49a054e318f00943394538820ea4ac2cf44ddf2cea0f2af1977f8a"
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
