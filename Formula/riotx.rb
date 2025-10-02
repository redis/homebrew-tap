# Generated with JReleaser 1.20.0 at 2025-10-02T00:32:53.253690634Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.6.0/riotx-1.6.0.zip"
  version "1.6.0"
  sha256 "96420f19c9ebb187475cd73d88589f538f6e212649ce9a95a084b63d2e0c85fd"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.6.0", output
  end
end
