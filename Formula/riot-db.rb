class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.2"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.2/riot-db-2.11.2.zip"
  sha256 "7140ebfd54c27f4fcc62a6986caa8942ecbdeb0ecb6eaee3d05ad0658de93946"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.11.2", output
  end
end