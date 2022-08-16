# Generated with JReleaser 1.1.0 at 2022-08-16T14:19:19.551284408Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.17.0/riot-stream-2.17.0.zip"
  version "2.17.0"
  sha256 "e4d220cff5d5de5780654e3e0e36e2fb1ae78f3ec7f6cc70d8bfb2bea61a1c93"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.17.0", output
  end
end
