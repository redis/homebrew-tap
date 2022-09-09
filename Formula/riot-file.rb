# Generated with JReleaser 1.2.0 at 2022-09-09T04:32:49.130963172Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.0/riot-file-2.18.0.zip"
  version "2.18.0"
  sha256 "3bf096b731202111cd7071192486f4cba232c2ddfc3802b10f4f5ce6282a6aaf"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.18.0", output
  end
end
