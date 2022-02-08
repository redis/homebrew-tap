# Generated with JReleaser 1.0.0-M1 at 2022-02-08T07:12:51.8421Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.2/riot-file-2.15.2.zip"
  version "2.15.2"
  sha256 "a2578f4b812586997a9f3614d0d24d280d5d055d6767306f025245a0f40e6039"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.15.2", output
  end
end
