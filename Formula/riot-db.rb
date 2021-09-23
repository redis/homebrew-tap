class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  version "2.13.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.13.0/riot-db-2.13.0.zip"
  sha256 "f637c4b77ba89b54704cbe3fd8e67c19cb90e200a277cfac77acdf307963aba0"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.13.0", output
  end
end