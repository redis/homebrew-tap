# Generated with JReleaser 1.27.0-SNAPSHOT at 2026-09-16T19:32:23.67743822Z

class Korvet < Formula
  desc "Kafka-compatible streaming service with automatic local/remote data tiering"
  homepage "https://github.com/redis-field-engineering/korvet-dist"
  url "https://github.com/redis-field-engineering/korvet-dist/releases/download/v0.20.0/korvet-0.20.0.zip"
  version "0.20.0"
  sha256 "2b77007a54bd2260326de1b68b109d8e05c52e60a00b9b96b65ac286d31f4852"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/korvet" => "korvet"
  end

  test do
    output = shell_output("#{bin}/korvet --version")
    assert_match "0.20.0", output
  end
end
