class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.1/riot-redis-2.14.1.zip"
  version "2.14.1"
  sha256 "31597239d4df35e63f66b82e2f1cc6cfb6ac7a4f7a4ef0673df38a8c576256ef"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.14.1", output
  end
end
