# Generated with JReleaser 1.2.0 at 2022-09-27T05:11:04.381734046Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.4/riot-stream-2.18.4.zip"
  version "2.18.4"
  sha256 "0ca52f6e4d803c615befcbf0ef8c3ce472a47f894e808d33465460959f4e336b"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.18.4", output
  end
end
