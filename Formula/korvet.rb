# Generated with JReleaser 1.24.0 at 2026-06-18T19:56:20.773432-07:00

class Korvet < Formula
  desc "Kafka-compatible streaming service with automatic local/remote data tiering"
  homepage "https://github.com/redis-field-engineering/korvet-dist"
  url "https://github.com/redis-field-engineering/korvet-dist/releases/download/v0.18.0/korvet-0.18.0.zip"
  version "0.18.0"
  sha256 "33e67fbe2a74694e0fcc76401292ec93ac07fb274ced4a301a21bac21907d16e"
  license "Apache-2.0"

  depends_on "openjdk"
  depends_on "redis"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/korvet" => "korvet"
  end

  test do
    output = shell_output("#{bin}/korvet --version")
    assert_match "0.18.0", output
  end
end
