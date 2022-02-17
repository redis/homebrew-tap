# Generated with JReleaser 1.0.0-M2 at 2022-02-17T00:40:24.343662Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.4/riot-file-2.15.4.zip"
  version "2.15.4"
  sha256 "569cf71ad468759db5eadf77afee9c20b7d00d0b28f94a2b495990034ece3efe"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.15.4", output
  end
end
