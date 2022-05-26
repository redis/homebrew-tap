# Generated with JReleaser 1.0.0 at 2022-05-26T05:20:05.406894Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.5/riot-redis-2.15.5.zip"
  version "2.15.5"
  sha256 "9daf5d52db208166d4d23bd186c45ae465582de93ab3150f499a2ecefe94775a"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.15.5", output
  end
end
