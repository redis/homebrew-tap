# Generated with JReleaser 1.22.0 at 2026-01-16T01:05:41.080008623Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "/v1.7.5/riotx-1.7.5.zip"
  version "1.7.5"
  sha256 "00581e1c9ee8ec3a6a8e6401c585e89990b689577c6af2ac3a1f21d8beef8ff5"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.7.5", output
  end
end
