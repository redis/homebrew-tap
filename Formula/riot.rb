# Generated with JReleaser 1.8.0-SNAPSHOT at 2023-07-11T08:23:56.551766451Z
class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.1.3/riot-3.1.3.zip"
  version "3.1.3"
  sha256 "ea140b8211620513e9932d96a6f6b1a6c67ca502bd81d7210d0632b70cde7c67"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.1.3", output
  end
end
