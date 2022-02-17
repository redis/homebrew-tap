# Generated with JReleaser 1.0.0-M2 at 2022-02-17T00:40:24.343662Z
class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.4/riot-redis-2.15.4.zip"
  version "2.15.4"
  sha256 "4c7b9ca7e116e5afa6e1276f468c8b3cce5b1a524e9ca4bfa994288a2dbdf25b"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis" => "riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.15.4", output
  end
end
