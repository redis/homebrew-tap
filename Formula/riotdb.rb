# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-21T07:01:33.780819408Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.9.0/riot-db-2.9.0.zip"
  version "2.9.0"
  sha256 "54a1ee8221d654a3d8777cec4ca31c303da270253f80e2677ce75593fbbddeb8"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.9.0", output
  end
end
