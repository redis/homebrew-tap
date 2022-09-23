# Generated with JReleaser 1.2.0 at 2022-09-23T03:36:54.632777695Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.3/riot-redis-2.18.3.zip"
  version "2.18.3"
  sha256 "e45e212865bc8c71ccb3e3490629cd5030c1f504c83220c66baac284bbe34861"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.18.3", output
  end
end
