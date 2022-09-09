# Generated with JReleaser 1.2.0 at 2022-09-09T05:28:02.600672155Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.1/riot-file-2.18.1.zip"
  version "2.18.1"
  sha256 "c2eab072b670a2839c0672c7a6ae2e0b0710f6667ef0e65debf284f445dd8288"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.18.1", output
  end
end
