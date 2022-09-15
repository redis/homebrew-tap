# Generated with JReleaser 1.2.0 at 2022-09-15T04:25:36.244421115Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.2/riot-file-2.18.2.zip"
  version "2.18.2"
  sha256 "1e8b02ebdd94983d600fc34e85394b2df034ba44abd77394358318f39c8a1242"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.18.2", output
  end
end
