class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.2/riot-redis-2.14.2.zip"
  version "2.14.2"
  sha256 "207c3f6f0b8e04492869f7a8ddb334b70ccd2875295bd07512d5c189e8293d00"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.14.2", output
  end
end
