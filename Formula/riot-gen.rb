# Generated with JReleaser 1.2.0 at 2022-09-23T03:36:54.632777695Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.3/riot-gen-2.18.3.zip"
  version "2.18.3"
  sha256 "4dc203e70a55582000bf5082fe6310b3c3c63f68d852dcb391f4a22b2fdab478"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.18.3", output
  end
end
