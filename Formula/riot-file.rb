# Generated with JReleaser 1.1.0 at 2022-08-01T21:42:17.401716313Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.2/riot-file-2.16.2.zip"
  version "2.16.2"
  sha256 "171777d8f8eb12c15e6ece5c439ac38be0727841707af397c418166b6f7d8040"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.16.2", output
  end
end
