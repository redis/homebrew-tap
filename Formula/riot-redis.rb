class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.12.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.12.0/riot-redis-2.12.0.zip"
  sha256 "604ef67c59dfcf13c69c67e28e682b8eecd6db3362ede1dee727c8c2c23fcf0d"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@11"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.12.0", output
  end
end