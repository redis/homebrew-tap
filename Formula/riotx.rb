# Generated with JReleaser 1.20.0 at 2025-09-27T00:55:40.142944585Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.5.7/riotx-1.5.7.zip"
  version "1.5.7"
  sha256 "ee171c821850a48696f2be3db05e15f32913dc02c8297be34fd1cdf57e69190b"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.5.7", output
  end
end
