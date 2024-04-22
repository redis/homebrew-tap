# Generated with JReleaser 1.12.0-SNAPSHOT at 2024-04-22T21:47:39.315099868Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.2.2/riot-3.2.2.zip"
  version "3.2.2"
  sha256 "f8c3b3d76e975b2e04794b66f8d51cb7f1d2e0b3218a114bbc2d7d277186757e"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.2.2", output
  end
end
