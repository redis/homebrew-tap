# Generated with JReleaser 1.1.0 at 2022-07-22T06:07:42.818466081Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.1/riot-stream-2.16.1.zip"
  version "2.16.1"
  sha256 "a7d9663177da55594d42e54cf88ad21b99c4effc6855c5624930225dd0723608"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream" => "riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.16.1", output
  end
end
