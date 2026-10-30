# Generated with JReleaser 1.26.0 at 2026-10-30T21:01:40.245133761Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.15.2/riotx-1.15.2.zip"
  version "1.15.2"
  sha256 "19ec128a5b57cbd09b586d4c0203a75ed5dcd9db9455384c6f0dac2defa91976"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.15.2", output
  end
end
