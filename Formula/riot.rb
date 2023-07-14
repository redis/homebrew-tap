# Generated with JReleaser 1.8.0-SNAPSHOT at 2023-07-14T05:48:58.215271027Z
class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.1.4/riot-3.1.4.zip"
  version "3.1.4"
  sha256 "4a499684c8e7888cb6cd224d87fd37fe609ed32e0416c818b517b4cfa12699aa"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.1.4", output
  end
end
