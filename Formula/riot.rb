# Generated with JReleaser 1.13.1 at 2024-08-25T23:45:41.873587505Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  url "https://github.com/redis/riot/releases/download/v4.1.2/riot-4.1.2.zip"
  version "4.1.2"
  sha256 "b73d2d5b0c23a4412f5d4ef5c60f3335ff80d6299d93f9c2829d15df11da1ccf"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "4.1.2", output
  end
end
