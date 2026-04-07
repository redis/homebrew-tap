# Generated with JReleaser 1.23.0 at 2026-04-07T06:05:36.831909307Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.8.0/riotx-1.8.0.zip"
  version "1.8.0"
  sha256 "434d1dad38d2e9f4f24206c0db6c851a47f1f10ffd1c4d10e832bb3e135522fa"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.8.0", output
  end
end
