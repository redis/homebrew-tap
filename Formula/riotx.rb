# Generated with JReleaser 1.22.0 at 2026-01-16T02:09:14.431225311Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "/v1.7.8/riotx-1.7.8.zip"
  version "1.7.8"
  sha256 "e6e417d80597d13e92e738f4519c878a30484bf98138fd5a2bc1ef1c7bd2c744"
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
