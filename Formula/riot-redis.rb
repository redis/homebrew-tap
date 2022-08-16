# Generated with JReleaser 1.1.0 at 2022-08-16T14:19:19.551284408Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.17.0/riot-redis-2.17.0.zip"
  version "2.17.0"
  sha256 "6e04d63d1d1f28cfc37dbddfd63f539260a9ee4e835691b20b99e960d9ab7b78"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.17.0", output
  end
end
