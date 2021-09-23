class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  version "2.13.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.13.0/riot-stream-2.13.0.zip"
  sha256 "02ca2bb873886af1a10f5daa389d2dba6aaf4dc4f960c8adf09efcf1aff282eb"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.13.0", output
  end
end