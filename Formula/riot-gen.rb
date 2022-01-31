# Generated with JReleaser 1.0.0-M1 at 2022-01-31T22:28:54.136986Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.1/riot-gen-2.15.1.zip"
  version "2.15.1"
  sha256 "5a6974893b1c3b0136f18701d306d3e834c6fa0a5f52183e4522547bbd4ddcd6"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.15.1", output
  end
end
