# Generated with JReleaser 1.0.0-M2 at 2022-02-17T00:40:24.343662Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.4/riot-db-2.15.4.zip"
  version "2.15.4"
  sha256 "a7628967ed084bab56e9cf87ab64ddd54564f3e99f23e1ffa62ec82ce262c447"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.15.4", output
  end
end
