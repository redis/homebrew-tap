# Generated with JReleaser 1.7.0-SNAPSHOT at 2023-06-02T05:59:45.932074988Z
class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.0.1/riot-3.0.1.zip"
  version "3.0.1"
  sha256 "d4cb2e81b564dd1a9970d0e95e34d1359480dc149e97577388105fd400bf2647"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.0.1", output
  end
end
