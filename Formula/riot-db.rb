class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.2/riot-db-2.14.2.zip"
  version "2.14.2"
  sha256 "cde1f15ef57c0dd197e8c04186deb435261766ffb499125be945ba12ab97a10a"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.14.2", output
  end
end
