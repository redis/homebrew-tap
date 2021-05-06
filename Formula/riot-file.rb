class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.3"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.3/riot-file-2.11.3.zip"
  sha256 "9effa0159df8fcad5fdf6c042e418baba70c88dcfd5f1dced29f73eb0f74fe53"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.11.3", output
  end
end