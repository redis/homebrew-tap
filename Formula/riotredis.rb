# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-21T07:14:52.664595681Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.19.0/riot-redis-2.19.0.zip"
  version "2.19.0"
  sha256 "b7db6f5e2a15d73017e2132a86f9c3285b9333eb58dc29e2f0e2e58f3133f836"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.19.0", output
  end
end
