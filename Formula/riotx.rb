# Generated with JReleaser 1.20.0 at 2025-09-12T02:06:14.933742777Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.5.3/riotx-1.5.3.zip"
  version "1.5.3"
  sha256 "af0aefb6d0e8a82a94129bf574dfb621640146fd6dbda91399db29859132e4b8"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.5.3", output
  end
end
