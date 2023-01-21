# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-21T07:14:52.664595681Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.19.0/riot-db-2.19.0.zip"
  version "2.19.0"
  sha256 "e8d28ea0125c0f46a01542e1be348d352ee0686b07d1eba6c3d205a033eb936a"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.19.0", output
  end
end
