# Generated with JReleaser 1.23.0 at 2026-04-22T17:44:54.406159909Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.9.0/riotx-1.9.0.zip"
  version "1.9.0"
  sha256 "35c2249aaa533dc8d32a2c49796e75150b1e424da83a9c6a6c27f864a15e6f9f"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.9.0", output
  end
end
