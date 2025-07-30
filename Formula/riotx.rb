# Generated with JReleaser 1.19.0 at 2025-07-30T16:18:03.182097013Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.0.0/riotx-1.0.0.zip"
  version "1.0.0"
  sha256 "5b330f39dced35e38b1328cc9655ea45580c403fca27b0386f49f4710ab52e3a"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.0.0", output
  end
end
