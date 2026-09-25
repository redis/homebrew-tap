# Generated with JReleaser 1.26.0 at 2026-09-25T20:33:01.159497548Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.15.1/riotx-1.15.1.zip"
  version "1.15.1"
  sha256 "109b7fc9cf9de3431f6559c3a35444feba3f8d781b3bb5038a3fa96f0b91e973"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.15.1", output
  end
end
