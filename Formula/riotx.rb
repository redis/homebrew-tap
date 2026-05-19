# Generated with JReleaser 1.24.0 at 2026-05-19T20:42:54.351251063Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.11.1/riotx-1.11.1.zip"
  version "1.11.1"
  sha256 "30d92060d44bed5bfd44c02b941e683e9a2d46a91649db829dd6c8852cb248e7"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.11.1", output
  end
end
