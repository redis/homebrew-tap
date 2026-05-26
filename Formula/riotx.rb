# Generated with JReleaser 1.24.0 at 2026-05-26T22:18:37.162756867Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.11.2/riotx-1.11.2.zip"
  version "1.11.2"
  sha256 "6e9fd911787d5f4dc3382fb6d9b808f6aa1571e3a08bf8d9088daa42cfc4d24d"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.11.2", output
  end
end
