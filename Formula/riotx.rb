# Generated with JReleaser 1.19.0 at 2025-08-12T04:41:11.586064187Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.3.1/riotx-1.3.1.zip"
  version "1.3.1"
  sha256 "784b9363285d7dd2e194f21b0da3dfada7151c3fdb35e08fb5f351cf0b4ab868"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.3.1", output
  end
end
