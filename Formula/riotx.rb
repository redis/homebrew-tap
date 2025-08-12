# Generated with JReleaser 1.19.0 at 2025-08-12T02:11:15.372220619Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.3.0/riotx-1.3.0.zip"
  version "1.3.0"
  sha256 "21cf1e3671c9d178a174789e2ee7a0e8e9f5a14d926705ba7d450f008b157ca0"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.3.0", output
  end
end
