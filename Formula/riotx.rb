# Generated with JReleaser 1.21.0 at 2025-11-11T00:41:35.376557819Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.7.2/riotx-1.7.2.zip"
  version "1.7.2"
  sha256 "f5cc6766309b18c624d27c02eadae92d546d33ae984ac5f72ca5d9c5a9bb0645"
  license "Apache-2.0"

  depends_on "openjdk@25"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.7.2", output
  end
end
