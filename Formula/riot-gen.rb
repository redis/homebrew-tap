# Generated with JReleaser 1.2.0 at 2022-09-09T05:28:02.600672155Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.1/riot-gen-2.18.1.zip"
  version "2.18.1"
  sha256 "c7ebb38342cadc86117a9480635aacc37dc2468ff8c15fa1cfb8e25f2a0554d2"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.18.1", output
  end
end
