# Generated with JReleaser 1.1.0 at 2022-08-16T14:19:19.551284408Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.17.0/riot-file-2.17.0.zip"
  version "2.17.0"
  sha256 "6deae8f430c30fe62a1adbf5515137a70116028024c2041008eb6c148c6cbb74"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.17.0", output
  end
end
