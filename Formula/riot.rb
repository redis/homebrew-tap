# Generated with JReleaser 1.12.0 at 2024-06-17T19:17:58.348871922Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  url "https://github.com/redis/riot/releases/download/v4.0.2/riot-4.0.2.zip"
  version "4.0.2"
  sha256 "e3c8fa9db358fbd37d30b22c2cf881d9dd7ff6b847d3cbc3a1b18afc55e5196f"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "4.0.2", output
  end
end
