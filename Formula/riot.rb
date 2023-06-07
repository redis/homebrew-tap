# Generated with JReleaser 1.7.0-SNAPSHOT at 2023-06-07T16:57:04.670996308Z
class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.0.3/riot-3.0.3.zip"
  version "3.0.3"
  sha256 "a2daff1e9dae331757ed04db6f6926cb8b1f178379a2dc02bac497f8810c400c"
  license "Apache-2.0"

  depends_on "openjdk@20"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.0.3", output
  end
end
