class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  version "2.14.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.0/riot-db-2.14.0.zip"
  sha256 "efb9880a276ec25df83d46b67e1ac161da7f515f2aff44c2841da6369ff225ae"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.14.0", output
  end
end