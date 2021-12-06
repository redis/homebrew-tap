class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.3/riot-file-2.14.3.zip"
  version "2.14.3"
  sha256 "614d844971f3aec9e39d00975410b4b8c2d6ff31cc1e24ba92aed5e9ff452a83"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.14.3", output
  end
end
