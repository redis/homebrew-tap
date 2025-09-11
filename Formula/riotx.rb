# Generated with JReleaser 1.20.0 at 2025-09-11T02:06:53.252892841Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.5.2/riotx-1.5.2.zip"
  version "1.5.2"
  sha256 "e10569212f76557f7c4bdce2760188c9f5ac8a189cfcbcd9a7b9c74365c8d6e6"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.5.2", output
  end
end
