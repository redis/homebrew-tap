# Generated with JReleaser 1.2.0 at 2022-09-27T05:11:04.381734046Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.4/riot-redis-2.18.4.zip"
  version "2.18.4"
  sha256 "4d6dc3936b8e8dc75def6043e4f01fdb02e965504a090b0eb8358ca1694ddb32"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.18.4", output
  end
end
