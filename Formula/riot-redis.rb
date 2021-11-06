class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  version "2.14.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.0/riot-redis-2.14.0.zip"
  sha256 "6f235d862898614d211633c0f6548a40b698c91117bd2f0fb5c9e01ac63a2c5f"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.14.0", output
  end
end