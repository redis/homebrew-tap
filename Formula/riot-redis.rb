# Generated with JReleaser 0.10.0 at 2021-12-30T02:04:19.40751Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.4/riot-redis-2.14.4.zip"
  version "2.14.4"
  sha256 "1d100aad86c8c1c57c1721fbf8d4dc47bd763da290103c5d2c3e6b041c20e657"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.14.4", output
  end
end
