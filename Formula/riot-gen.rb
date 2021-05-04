class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.0/riot-gen-2.11.0.zip"
  sha256 "a52819d444866c5be5f5c2c0893c2393f2e5fc29b4fee21ecc1d7ff7facf42f7"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.11.0", output
  end
end