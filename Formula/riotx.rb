# Generated with JReleaser 1.24.0 at 2026-06-17T01:53:59.384734485Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.14.1/riotx-1.14.1.zip"
  version "1.14.1"
  sha256 "eab522657494786280725696481b682e49ca8e197ccdf4665aa05148c49f9ce9"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.14.1", output
  end
end
