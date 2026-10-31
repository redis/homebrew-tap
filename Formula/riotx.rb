# Generated with JReleaser 1.26.0 at 2026-10-31T09:16:12.079098849Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.15.3/riotx-1.15.3.zip"
  version "1.15.3"
  sha256 "10d3fa9e6eb18668cf36cf0909a85728e4ac3829ff7538c16548a86b58c55073"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.15.3", output
  end
end
