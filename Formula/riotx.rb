# Generated with JReleaser 1.24.0 at 2026-05-14T22:36:33.189767446Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.11.0/riotx-1.11.0.zip"
  version "1.11.0"
  sha256 "3a826f0d6229121662c10af8d8801ac733379dee133e5b4cf97862dd0c023e3a"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.11.0", output
  end
end
