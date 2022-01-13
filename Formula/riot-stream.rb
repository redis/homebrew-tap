# Generated with JReleaser 0.10.0 at 2022-01-13T06:09:31.122152Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.0/riot-stream-2.15.0.zip"
  version "2.15.0"
  sha256 "8f6693fbb5a12a7bb093933702551fa7f36d95420ab50b72a8605a828d8c5ace"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.15.0", output
  end
end
