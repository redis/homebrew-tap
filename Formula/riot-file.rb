# Generated with JReleaser 0.10.0 at 2021-12-30T02:04:19.40751Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.4/riot-file-2.14.4.zip"
  version "2.14.4"
  sha256 "644db05193d141977be30de1071f44fb3a13954549f0ec315035cbe1735130dc"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.14.4", output
  end
end
