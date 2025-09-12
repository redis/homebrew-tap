# Generated with JReleaser 1.20.0 at 2025-09-12T16:58:10.236095922Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.5.4/riotx-1.5.4.zip"
  version "1.5.4"
  sha256 "a63067b31dd16be051fc0c4358583733a8f09f9542a965abd9abed2c5e3263fc"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.5.4", output
  end
end
