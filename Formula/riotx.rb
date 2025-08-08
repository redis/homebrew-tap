# Generated with JReleaser 1.19.0 at 2025-08-08T17:54:52.348163019Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.2.2/riotx-1.2.2.zip"
  version "1.2.2"
  sha256 "fe499a7adc8dc2039707f156193c3b62eeb56c4e707c2b473696d2ac918df479"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.2.2", output
  end
end
