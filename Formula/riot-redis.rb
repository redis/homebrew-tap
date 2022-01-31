# Generated with JReleaser 1.0.0-M1 at 2022-01-31T22:28:54.136986Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.1/riot-redis-2.15.1.zip"
  version "2.15.1"
  sha256 "384cfb716369dae01fa5d6b8aa391e265bbc22b7f9ef0effd6d2c994a0f70879"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.15.1", output
  end
end
