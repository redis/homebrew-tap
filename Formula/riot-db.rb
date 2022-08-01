# Generated with JReleaser 1.1.0 at 2022-08-01T21:42:17.401716313Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.2/riot-db-2.16.2.zip"
  version "2.16.2"
  sha256 "4244c21ad9dd539a01b64df9780168e01c7591b082d0ef6dff6ec47573786d8b"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.16.2", output
  end
end
