# Generated with JReleaser 1.0.0 at 2022-06-25T18:40:04.260101Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.0/riot-file-2.16.0.zip"
  version "2.16.0"
  sha256 "730ecdfb70c639a9703282346a8ed2931e54d21056725c50e38d3d53fbf4139a"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.16.0", output
  end
end
