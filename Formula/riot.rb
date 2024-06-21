# Generated with JReleaser 1.12.0 at 2024-06-21T22:49:44.568083263Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  url "https://github.com/redis/riot/releases/download/v4.0.3/riot-4.0.3.zip"
  version "4.0.3"
  sha256 "3cad26984f509e93b58d0a9e4761bd91324c6b79e4045ba0f5a90917fb5092db"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "4.0.3", output
  end
end
