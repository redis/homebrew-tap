# Generated with JReleaser 1.2.0 at 2022-09-09T05:28:02.600672155Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.1/riot-stream-2.18.1.zip"
  version "2.18.1"
  sha256 "26781d88eabd873249e7d85f0b44a79f691a9a3576930ec613891692c447cae7"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.18.1", output
  end
end
