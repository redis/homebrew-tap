# Generated with JReleaser 1.1.0 at 2022-08-01T21:42:17.401716313Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.2/riot-gen-2.16.2.zip"
  version "2.16.2"
  sha256 "2842f6d3d30cddfe1bbb117663a52de8953d4a196f4044cea04065d3ad10ea4d"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.16.2", output
  end
end
