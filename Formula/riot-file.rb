class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.1/riot-file-2.14.1.zip"
  version "2.14.1"
  sha256 "0c6d88bdb713df934ea5e974259e2a1f6bd22f5ae85532aaf2e442f456c36064"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.14.1", output
  end
end
