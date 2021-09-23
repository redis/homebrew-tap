class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  version "2.13.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.13.0/riot-redis-2.13.0.zip"
  sha256 "d0fb44fa259911554337147910b5adb55faaebc70133ae0c51ec889be9427382"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.13.0", output
  end
end