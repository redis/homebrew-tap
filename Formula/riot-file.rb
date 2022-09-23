# Generated with JReleaser 1.2.0 at 2022-09-23T03:36:54.632777695Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.3/riot-file-2.18.3.zip"
  version "2.18.3"
  sha256 "c293f5a716d10ef45f31b72476504efd2c0df18d6986aea3c8dba0430c2c3269"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.18.3", output
  end
end
