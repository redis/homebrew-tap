# Generated with JReleaser 1.1.0 at 2022-07-22T06:07:42.818466081Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.1/riot-redis-2.16.1.zip"
  version "2.16.1"
  sha256 "93209259bbfeff63a530808b0bd7a9ec58119da38717482c079de5114c66fb31"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.16.1", output
  end
end
