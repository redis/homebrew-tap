# Generated with JReleaser 1.18.0 at 2025-06-12T15:27:36.458521967Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.8.0/riotx-0.8.0.zip"
  version "0.8.0"
  sha256 "c8138b4160056df5a1a43c5dff2689f5a0c048e1787dc282b71eccd92e5d3be7"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "0.8.0", output
  end
end
