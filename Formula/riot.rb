# Generated with JReleaser 1.12.0-SNAPSHOT at 2024-04-24T17:37:46.581851101Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.2.3/riot-3.2.3.zip"
  version "3.2.3"
  sha256 "32781b1d86ac7afc7b79a94a7099c5345fc03cbec964c5fa8d6eb077e7f311e4"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.2.3", output
  end
end
