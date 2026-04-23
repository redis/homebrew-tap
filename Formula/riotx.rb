# Generated with JReleaser 1.23.0 at 2026-04-23T21:57:23.018102496Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.10.0/riotx-1.10.0.zip"
  version "1.10.0"
  sha256 "32eab1769dcfb67804edf7e52d450f7571a2e535a18a97a1d654916db407a019"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.10.0", output
  end
end
