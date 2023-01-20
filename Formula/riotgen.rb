# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-19T16:31:44.892896-08:00
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.6/riot-gen-2.18.6.zip"
  version "2.18.6"
  sha256 "917f40f574c49356eb8c2fe735a4546ca1961fdedd0bab5f7498254857ed80d7"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.18.6", output
  end
end
