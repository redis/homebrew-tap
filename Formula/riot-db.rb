# Generated with JReleaser 1.2.0 at 2022-09-27T05:11:04.381734046Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.4/riot-db-2.18.4.zip"
  version "2.18.4"
  sha256 "6e300c814ff90007645a631c355a1060d8be767d6bfc7445ee6cb65de6703d3e"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.18.4", output
  end
end
