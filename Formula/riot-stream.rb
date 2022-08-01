# Generated with JReleaser 1.1.0 at 2022-08-01T21:42:17.401716313Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.2/riot-stream-2.16.2.zip"
  version "2.16.2"
  sha256 "5d4345174a88bf3b32033d196ff42d50f5ce560ada8d3cd4bc2ff974df6f996d"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.16.2", output
  end
end
