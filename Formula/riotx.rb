# Generated with JReleaser 1.23.0 at 2026-03-26T16:27:21.857248823Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.7.10/riotx-1.7.10.zip"
  version "1.7.10"
  sha256 "7711586c0632fbddb51b6272064daf296d4ddf4b8bc7fca32392bfd2e9198889"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.7.10", output
  end
end
