# Generated with JReleaser 1.1.0 at 2022-07-22T06:07:42.818466081Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.1/riot-db-2.16.1.zip"
  version "2.16.1"
  sha256 "483474e023425d2705d4ed27fb7e2875b8bb25b1c34c3df852be23d053d59776"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.16.1", output
  end
end
