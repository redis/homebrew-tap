# Generated with JReleaser 1.2.0 at 2022-09-09T04:32:49.130963172Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.0/riot-stream-2.18.0.zip"
  version "2.18.0"
  sha256 "eede1c3c005731b14d709a19cabaed43b42dfbf5d3c1d1ad667ed468d38f15d0"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.18.0", output
  end
end
