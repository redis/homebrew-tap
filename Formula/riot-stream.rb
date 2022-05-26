# Generated with JReleaser 1.0.0 at 2022-05-26T05:20:05.406894Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.5/riot-stream-2.15.5.zip"
  version "2.15.5"
  sha256 "36c5493dda36126f071d9c26e5f1a4ea057186fac9f09dc342e5da087e8c7781"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.15.5", output
  end
end
