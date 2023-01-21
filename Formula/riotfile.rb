# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-21T07:14:52.664595681Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.19.0/riot-file-2.19.0.zip"
  version "2.19.0"
  sha256 "78d28f8eea00a1e989b80676d20e00d7ee720daa5c8c730a4e17568eac0a3491"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.19.0", output
  end
end
