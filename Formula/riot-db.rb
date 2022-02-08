# Generated with JReleaser 1.0.0-M1 at 2022-02-08T07:12:51.8421Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.2/riot-db-2.15.2.zip"
  version "2.15.2"
  sha256 "7b9a5f74ecb2e690568d198b193e21b25d3d984b159bf3b45a2439951cd19e20"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.15.2", output
  end
end
