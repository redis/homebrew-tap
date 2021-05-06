class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.3"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.3/riot-stream-2.11.3.zip"
  sha256 "62511bdb5a7eae1e8e15bdc4759cfa649525a51bab83716416702e9097bec6a3"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.11.3", output
  end
end