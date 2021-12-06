class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.3/riot-redis-2.14.3.zip"
  version "2.14.3"
  sha256 "4ab5c28bd6199fa5e368c935384e65f4af9bf871b2f4bc42906871fc7c3fc765"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.14.3", output
  end
end
