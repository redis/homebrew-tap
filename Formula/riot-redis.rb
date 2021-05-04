class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.1"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.1/riot-redis-2.11.1.zip"
  sha256 "fb4b772a78f38ec50ba68776d42a9efd1573ea01521a69831e954df0341d88ed"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.11.1", output
  end
end