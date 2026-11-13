# Generated with JReleaser 1.27.0-SNAPSHOT at 2026-09-16T19:32:23.67743822Z

class Korvet < Formula
  desc "Kafka-compatible streaming service with automatic local/remote data tiering"
  homepage "https://github.com/redis-field-engineering/korvet-dist"
  url "https://github.com/redis-field-engineering/korvet-dist/releases/download/v0.20.1/korvet-0.20.1.zip"
  version "0.20.1"
  sha256 "f7c6585de1f5b9aa09578b62682f5535d24971300950cd2c8c6c8510ddad0d20"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/korvet" => "korvet"
  end

  test do
    output = shell_output("#{bin}/korvet --version")
    assert_match "0.20.1", output
  end
end
