# Generated with JReleaser 1.0.0-M1 at 2022-02-08T07:12:51.8421Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.2/riot-stream-2.15.2.zip"
  version "2.15.2"
  sha256 "3524bfbabe15fd9527470006191bf508475842f230f719f04691c0640aeb341e"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.15.2", output
  end
end
