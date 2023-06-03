# Generated with JReleaser 1.7.0-SNAPSHOT at 2023-06-03T06:36:46.620470957Z
class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.0.2/riot-3.0.2.zip"
  version "3.0.2"
  sha256 "4965657bd4e86a761944761b498f63b3e018e3a91d08c1e3225831dc2caf71f3"
  license "Apache-2.0"

  depends_on "openjdk@20"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.0.2", output
  end
end
