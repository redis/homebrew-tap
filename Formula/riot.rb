# Generated with JReleaser 1.11.0 at 2024-03-18T22:40:17.78948266Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.2.0/riot-3.2.0.zip"
  version "3.2.0"
  sha256 "fb39ce2c19e31ea6f9d6d3dede35d0da6408a41301e4783115d21f90e5ff7b1b"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.2.0", output
  end
end
