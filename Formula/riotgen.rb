# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-21T07:14:52.664595681Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.19.0/riot-gen-2.19.0.zip"
  version "2.19.0"
  sha256 "27eca5256858372f15eaa9d548ed4b31dfa47b5f9606eb590454b178f7cdd112"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.19.0", output
  end
end
