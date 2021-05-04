class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.1"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.1/riot-stream-2.11.1.zip"
  sha256 "a8ce4019893e95679179143bcbc9474b1dabd3b9d1fd0b3305c4b4849c275432"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.11.1", output
  end
end