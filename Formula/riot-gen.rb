# Generated with JReleaser 0.10.0 at 2021-12-30T02:04:19.40751Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.4/riot-gen-2.14.4.zip"
  version "2.14.4"
  sha256 "6eee1bb373706782c13689f58c1b3390aa6e66ca99f5a6389f7f5eff503b332b"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.14.4", output
  end
end
