class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.0/riot-redis-2.11.0.zip"
  sha256 "f252b01050b869e377c34f7a25c31020df0353dd8c559a981e1314579e2df624"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.11.0", output
  end
end