# Generated with JReleaser 0.10.0 at 2022-01-13T06:09:31.122152Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.0/riot-file-2.15.0.zip"
  version "2.15.0"
  sha256 "90b606c3f467be6cae4e1f89f88047e0b3e06abe18012e0ccf37bc6b8ab57c39"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.15.0", output
  end
end
