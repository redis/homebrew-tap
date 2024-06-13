# Generated with JReleaser 1.12.0 at 2024-06-13T03:56:06.292714264Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  url "https://github.com/redis/riot/releases/download/v4.0.1/riot-4.0.1.zip"
  version "4.0.1"
  sha256 "853bda565b3e849ecbb11ea0eec39cc1fb39d5a927d14c12a405a47f30de9c0b"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "4.0.1", output
  end
end
