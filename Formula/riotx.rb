# Generated with JReleaser 1.19.0 at 2025-08-19T01:29:15.438601189Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.4.0/riotx-1.4.0.zip"
  version "1.4.0"
  sha256 "3b4d147f58ce43b934262234b7d2f039138db186b5994ae93700800890baa62f"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.4.0", output
  end
end
