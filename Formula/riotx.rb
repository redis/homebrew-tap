# Generated with JReleaser 1.19.0 at 2025-08-08T01:31:02.381095842Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.2.1/riotx-1.2.1.zip"
  version "1.2.1"
  sha256 "933139e0539e16579e21cab33ed167d7a9981367348795374d85fa3a95c6bdc9"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.2.1", output
  end
end
