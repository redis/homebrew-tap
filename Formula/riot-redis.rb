# Generated with JReleaser 1.2.0 at 2022-09-15T04:25:36.244421115Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.2/riot-redis-2.18.2.zip"
  version "2.18.2"
  sha256 "baad32477a1c9e3c5f21e29528ba69409c22cecaa772d07100e5bd8f24829346"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.18.2", output
  end
end
