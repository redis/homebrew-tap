# Generated with JReleaser 1.8.0-SNAPSHOT at 2023-07-03T07:40:52.34747229Z
class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.1.1/riot-3.1.1.zip"
  version "3.1.1"
  sha256 "a40960bfdd8a519eed66fd92cb3d5698df9147d33c8fe354a5ed514a9291360f"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.1.1", output
  end
end
