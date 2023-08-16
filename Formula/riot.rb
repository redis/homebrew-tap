# Generated with JReleaser 1.8.0-SNAPSHOT at 2023-08-16T17:07:46.198064826Z
class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.1.5/riot-3.1.5.zip"
  version "3.1.5"
  sha256 "aabbc86ec33c4dd64ab3f73ea9166c51d29dcce3ad168a6a59ceba498e444428"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.1.5", output
  end
end
