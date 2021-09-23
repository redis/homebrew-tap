class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  version "2.13.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.13.0/riot-gen-2.13.0.zip"
  sha256 "21ce84368c2af64e9c9ae6c593a580d85cc7552e17f997c2d2f7b8f8fe86885c"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.13.0", output
  end
end