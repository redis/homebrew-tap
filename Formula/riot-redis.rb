# Generated with JReleaser 1.2.0 at 2022-09-09T04:32:49.130963172Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.0/riot-redis-2.18.0.zip"
  version "2.18.0"
  sha256 "745d1cebb9d66de2ee4e4a6664ad33c1a83464885dec7fb57f386a0adae6a519"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.18.0", output
  end
end
