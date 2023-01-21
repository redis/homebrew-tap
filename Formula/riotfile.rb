# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-21T07:01:33.780819408Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.9.0/riot-file-2.9.0.zip"
  version "2.9.0"
  sha256 "71cdb383e6fa785d7a4c9fa29c4b559a04fbc6910a6ac7dca2010c7b3a2b04bb"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.9.0", output
  end
end
