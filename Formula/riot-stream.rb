# Generated with JReleaser 1.2.0 at 2022-09-23T03:36:54.632777695Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.3/riot-stream-2.18.3.zip"
  version "2.18.3"
  sha256 "946aeecad1d1859a519ec3e5f73c3042aa6879989cb981311c34a9e2c5be22f7"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.18.3", output
  end
end
