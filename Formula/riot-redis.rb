# Generated with JReleaser 1.1.0 at 2022-08-01T21:42:17.401716313Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.2/riot-redis-2.16.2.zip"
  version "2.16.2"
  sha256 "b4aa7b3bd9c0ff1453e42c8d758414c42d7257d80c5636ce15429a4041cd862a"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.16.2", output
  end
end
