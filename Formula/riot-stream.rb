# Generated with JReleaser 0.10.0 at 2021-12-30T02:04:19.40751Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.4/riot-stream-2.14.4.zip"
  version "2.14.4"
  sha256 "9ea302fb94f4eedbe34b8a6e3742a0816031d1519e783b51f7e4381848fe0816"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.14.4", output
  end
end
