class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.3"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.3/riot-gen-2.11.3.zip"
  sha256 "e8bda217aaf32e39163563b6db1a8fc9705be502efde525d0efc3e68054598e1"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.11.3", output
  end
end