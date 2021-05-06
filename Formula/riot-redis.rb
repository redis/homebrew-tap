class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.3"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.3/riot-redis-2.11.3.zip"
  sha256 "d0e3ff699b0bf511d38f40c50d2e7959830df7dc51fb9b2b1ed2cdcc038ded52"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.11.3", output
  end
end