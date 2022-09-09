# Generated with JReleaser 1.2.0 at 2022-09-09T04:32:49.130963172Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.0/riot-gen-2.18.0.zip"
  version "2.18.0"
  sha256 "d1030e32baa96fb71c38abcd3281242aadb007f153491517cde575093f23ce37"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.18.0", output
  end
end
