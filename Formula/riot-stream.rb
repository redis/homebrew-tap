# Generated with JReleaser 1.0.0-M2 at 2022-02-17T00:40:24.343662Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.4/riot-stream-2.15.4.zip"
  version "2.15.4"
  sha256 "bf02fbd0fc2cf0dc37fafe70ea477b4064f2919c7c3f3efe49916d9bc207daa3"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.15.4", output
  end
end
