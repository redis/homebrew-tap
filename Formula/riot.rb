# Generated with JReleaser 1.14.0 at 2024-09-15T20:04:08.467809775Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  url "https://github.com/redis/riot/releases/download/v4.1.3/riot-4.1.3.zip"
  version "4.1.3"
  sha256 "a1c6fcdf0d26f050c2e90cb62ce3776722dccbd28085bca70b341612c8962f29"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "4.1.3", output
  end
end
