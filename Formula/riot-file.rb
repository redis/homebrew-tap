class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.2/riot-file-2.14.2.zip"
  version "2.14.2"
  sha256 "08cc20f0878154d8c74c999dd53152e76755882beec57ec2b1e753cde217dc7a"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.14.2", output
  end
end
