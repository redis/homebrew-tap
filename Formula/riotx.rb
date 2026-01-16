# Generated with JReleaser 1.22.0 at 2026-01-16T07:00:16.1132029Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.7.8/riotx-1.7.8.zip"
  version "1.7.8"
  sha256 "6d3b326270feaca330f35ff17ab1c69ba91c37533d52677dff0fb0cfa7a90d03"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.7.8", output
  end
end
