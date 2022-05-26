# Generated with JReleaser 1.0.0 at 2022-05-26T05:20:05.406894Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.5/riot-file-2.15.5.zip"
  version "2.15.5"
  sha256 "eaf5cd4278fd0b34f3ea65703022752acbc22d61de4f682fb7bd8cd361c176f4"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.15.5", output
  end
end
