# Generated with JReleaser 1.20.0 at 2025-09-01T00:05:52.376127506Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.5.0/riotx-1.5.0.zip"
  version "1.5.0"
  sha256 "66f4f310fd10bf9cf16e4d06eee6521d67e7f2b568fbabb6ed28a8c6757622ed"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.5.0", output
  end
end
