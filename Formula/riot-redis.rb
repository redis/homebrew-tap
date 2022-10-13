# Generated with JReleaser 1.2.0 at 2022-10-13T18:39:56.496308557Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.5/riot-redis-2.18.5.zip"
  version "2.18.5"
  sha256 "07705147c77e47bb5b77f0b7b3e101e4a8a5a95c0d7aed3d28cadccd475c6849"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.18.5", output
  end
end
