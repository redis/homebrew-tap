# Generated with JReleaser 1.2.0 at 2022-09-09T05:28:02.600672155Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.1/riot-redis-2.18.1.zip"
  version "2.18.1"
  sha256 "96e2a081525583d1544ed595e49147ca4e255ccf5014e5d87290bb540607dede"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.18.1", output
  end
end
