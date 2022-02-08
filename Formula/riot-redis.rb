# Generated with JReleaser 1.0.0-M1 at 2022-02-08T07:12:51.8421Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.2/riot-redis-2.15.2.zip"
  version "2.15.2"
  sha256 "3c6d481fc7f35524716b593b805aabc8d82bb3e851ea955b0f4daf68cf9e0bc0"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.15.2", output
  end
end
