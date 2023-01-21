# Generated with JReleaser 1.5.0-SNAPSHOT at 2023-01-21T07:01:33.780819408Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.9.0/riot-gen-2.9.0.zip"
  version "2.9.0"
  sha256 "82b4e1c621a61039a9110f7a262ed67a96c15f98471c2cc8b746f5817a9f1881"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.9.0", output
  end
end
