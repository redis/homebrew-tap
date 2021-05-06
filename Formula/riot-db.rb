class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.3"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.3/riot-db-2.11.3.zip"
  sha256 "4df18c98b02472766a1a1747b01c6c58a7372b18da47808c5714f828106e99f4"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.11.3", output
  end
end