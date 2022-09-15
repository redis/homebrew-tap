# Generated with JReleaser 1.2.0 at 2022-09-15T04:25:36.244421115Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.2/riot-stream-2.18.2.zip"
  version "2.18.2"
  sha256 "b310887bc1ad506cd46b6c56ba190a7cf340c5292641d2d4a7e449b14e7faebe"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.18.2", output
  end
end
