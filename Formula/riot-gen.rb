# Generated with JReleaser 0.10.0 at 2022-01-13T06:09:31.122152Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.0/riot-gen-2.15.0.zip"
  version "2.15.0"
  sha256 "8cc54fc04f08d08717e5bd1e2220059fd96c902795734ee187068a2a2002d69b"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.15.0", output
  end
end
