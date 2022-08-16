# Generated with JReleaser 1.1.0 at 2022-08-16T14:19:19.551284408Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.17.0/riot-gen-2.17.0.zip"
  version "2.17.0"
  sha256 "2658d61e52077eecd365f316519d7a6363009bb477eded7d59efe86c3707cd84"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.17.0", output
  end
end
