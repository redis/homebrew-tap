# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-19T16:31:44.892896-08:00
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.6/riot-db-2.18.6.zip"
  version "2.18.6"
  sha256 "c03416c1608e4cd1a44f0adeab356ac7cecbb2bd5c1bf37ab49cea7283030387"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.18.6", output
  end
end
