# Generated with JReleaser 0.10.0 at 2022-01-13T06:09:31.122152Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.0/riot-db-2.15.0.zip"
  version "2.15.0"
  sha256 "df194d7d93312e10d254537004f87dc91c2cba7bc26a9d1156eda12c83a6218f"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.15.0", output
  end
end
