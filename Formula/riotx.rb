# Generated with JReleaser 1.19.0 at 2025-08-06T02:29:39.362753812Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.1.0/riotx-1.1.0.zip"
  version "1.1.0"
  sha256 "9ad3605f830f502469fc3ac559998e9e16ed2d98db2c76cbded83eb555b99813"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.1.0", output
  end
end
