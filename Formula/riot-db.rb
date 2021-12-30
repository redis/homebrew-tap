# Generated with JReleaser 0.10.0 at 2021-12-30T02:04:19.40751Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.4/riot-db-2.14.4.zip"
  version "2.14.4"
  sha256 "ac2b94184822505ee869c03a5542a53ac403e48f3e17ab7f864d2e224f9e72a0"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.14.4", output
  end
end
