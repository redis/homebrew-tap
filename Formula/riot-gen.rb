# Generated with JReleaser 1.0.0 at 2022-06-25T18:40:04.260101Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.0/riot-gen-2.16.0.zip"
  version "2.16.0"
  sha256 "465ff16fc2f407b41de6ab8902d53580723f044857a11591ec8d655bcf439c96"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.16.0", output
  end
end
