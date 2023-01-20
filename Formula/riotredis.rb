# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-19T16:31:44.892896-08:00
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.6/riot-redis-2.18.6.zip"
  version "2.18.6"
  sha256 "7d471ec3733f46b9b24889665b9ca12748f5842d8914b762aa94eaa2eb54a0c9"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.18.6", output
  end
end
