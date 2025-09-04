# Generated with JReleaser 1.20.0 at 2025-09-04T06:37:17.552312031Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.5.1/riotx-1.5.1.zip"
  version "1.5.1"
  sha256 "67d69e0321cf339f494beaa5d5884b8ccd2ce7bac9d3acb554d7478ee963a214"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.5.1", output
  end
end
