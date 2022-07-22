# Generated with JReleaser 1.1.0 at 2022-07-22T06:07:42.818466081Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.1/riot-gen-2.16.1.zip"
  version "2.16.1"
  sha256 "e04e1418e8b42e525887933128b6de93c0d0a7426ccdce82418f4e2231f5ea49"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.16.1", output
  end
end
