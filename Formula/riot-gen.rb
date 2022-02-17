# Generated with JReleaser 1.0.0-M2 at 2022-02-17T00:40:24.343662Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.4/riot-gen-2.15.4.zip"
  version "2.15.4"
  sha256 "c12c574a7894dc77e6fb288f8818cc48ac011b3d79c9f550c60229811d26bdfd"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.15.4", output
  end
end
