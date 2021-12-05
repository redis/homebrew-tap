class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.1/riot-stream-2.14.1.zip"
  version "2.14.1"
  sha256 "5fb02b46ae959452e3aa3981cdc9bca2e3d6b0ec50717e5adc8a56e5c9c43cc2"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.14.1", output
  end
end
