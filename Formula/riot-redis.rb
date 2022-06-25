# Generated with JReleaser 1.0.0 at 2022-06-25T18:40:04.260101Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.0/riot-redis-2.16.0.zip"
  version "2.16.0"
  sha256 "af10d00dc28845c7c0e170791ef77b4fa562bd0fcbee19a0b19cf30e3ff09980"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.16.0", output
  end
end
