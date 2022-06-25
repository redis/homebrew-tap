# Generated with JReleaser 1.0.0 at 2022-06-25T18:40:04.260101Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.0/riot-stream-2.16.0.zip"
  version "2.16.0"
  sha256 "dff33b998b006e80d0267cb9c5f0cf3c03100a3aeb5719712bcd4783713bee8e"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.16.0", output
  end
end
