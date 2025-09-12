# Generated with JReleaser 1.20.0 at 2025-09-12T02:12:54.76802411Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.5.2/riotx-1.5.2.zip"
  version "1.5.2"
  sha256 "ae5daa6a21bfbc282c12a4aba042390766448ae2ca4d58217d2e3bedd6ef1182"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.5.2", output
  end
end
