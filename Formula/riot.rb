# Generated with JReleaser 1.7.0-SNAPSHOT at 2023-06-16T20:44:40.883738013Z
class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.0.4/riot-3.0.4.zip"
  version "3.0.4"
  sha256 "ae379f266e020e34de494218c5427caeb83cf0498e43ab46ed035513406bf515"
  license "Apache-2.0"

  depends_on "openjdk@20"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.0.4", output
  end
end
