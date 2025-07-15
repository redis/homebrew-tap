# Generated with JReleaser 1.19.0 at 2025-07-15T10:52:26.895721085Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.9.0/riotx-0.9.0.zip"
  version "0.9.0"
  sha256 "67183b82d1f5f439d9ed9111be5d5841f98234927b9ded10174e4f1a52638f68"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "0.9.0", output
  end
end
