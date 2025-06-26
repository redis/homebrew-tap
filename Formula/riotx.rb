# Generated with JReleaser 1.18.0 at 2025-06-26T11:08:05.80959663Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.8.2/riotx-0.8.2.zip"
  version "0.8.2"
  sha256 "f75085dea65e868c825f563f1dcae962ea120b48c1821602cbb076bc92e5bebc"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "0.8.2", output
  end
end
