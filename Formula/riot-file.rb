class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.2"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.2/riot-file-2.11.2.zip"
  sha256 "cf184fd9171822495347fe5751c482e6377c898355b95fb2a16eae02c115853e"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.11.2", output
  end
end