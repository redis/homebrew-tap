# Generated with JReleaser 1.13.1 at 2024-08-25T18:21:47.141579811Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  url "https://github.com/redis/riot/releases/download/v4.1.1/riot-4.1.1.zip"
  version "4.1.1"
  sha256 "7678735163a2b50c6cdbdbe55cc960a969fbcba920a9e1bdb96eea2af72ae904"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "4.1.1", output
  end
end
