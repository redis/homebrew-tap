# Generated with JReleaser 1.2.0 at 2022-09-15T04:25:36.244421115Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.2/riot-gen-2.18.2.zip"
  version "2.18.2"
  sha256 "3d76b44d31ad114bebf058fdbe930ab8f29016b4f3ca68d25e00244e3fc6d865"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.18.2", output
  end
end
