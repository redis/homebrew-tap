# Generated with JReleaser 1.20.0 at 2025-09-16T02:46:57.532074605Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.5.6/riotx-1.5.6.zip"
  version "1.5.6"
  sha256 "cdd9d59ec2979b3b037c94745dba28e2a99c4fb860f5b8f7ebdb8a8dca19eb0a"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.5.6", output
  end
end
