# Generated with JReleaser 1.24.0 at 2026-06-08T16:27:57.324502605Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.12.0/riotx-1.12.0.zip"
  version "1.12.0"
  sha256 "4c75fac2c62bcac0bb24c614633494e37d503067f9c153ca1536dfbc23d2711f"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.12.0", output
  end
end
