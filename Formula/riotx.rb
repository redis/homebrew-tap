# Generated with JReleaser 1.27.0 at 2026-11-04T17:40:34.491791163Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.15.4/riotx-1.15.4.zip"
  version "1.15.4"
  sha256 "e30729e7e688f21ac8508ac93154456260ee01d82113eb5261a11622f8ff0407"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.15.4", output
  end
end
