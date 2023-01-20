# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-19T16:31:44.892896-08:00
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.6/riot-file-2.18.6.zip"
  version "2.18.6"
  sha256 "ef637e1d720b46c749f1452ac73d7aa9754d39e916e4592fc2135ee30fdef559"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.18.6", output
  end
end
