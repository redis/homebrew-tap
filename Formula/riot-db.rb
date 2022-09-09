# Generated with JReleaser 1.2.0 at 2022-09-09T04:32:49.130963172Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.0/riot-db-2.18.0.zip"
  version "2.18.0"
  sha256 "a36df4600df48e840109901a3428dbbe9d1d47d4fa2bec334661693442abe91d"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.18.0", output
  end
end
