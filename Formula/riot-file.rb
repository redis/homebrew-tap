# Generated with JReleaser 1.0.0-M1 at 2022-01-31T22:28:54.136986Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.1/riot-file-2.15.1.zip"
  version "2.15.1"
  sha256 "ab877b623924e7d5af366c2508c07eb7a8020608dce9b58fa527522cfca85e14"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.15.1", output
  end
end
