# Generated with JReleaser 0.10.0 at 2022-01-13T06:09:31.122152Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.0/riot-redis-2.15.0.zip"
  version "2.15.0"
  sha256 "961bb0f4181547e3e4cf1a9e11bca822e6c8433fd7f86739ecb694f6c4f4fbc9"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.15.0", output
  end
end
