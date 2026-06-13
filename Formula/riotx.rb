# Generated with JReleaser 1.24.0 at 2026-06-13T17:29:47.704832039Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.14.0/riotx-1.14.0.zip"
  version "1.14.0"
  sha256 "95d05301c914fe13c40cc40cd731372e9dbfe832aaf5f1d77101db5ff8d1d410"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.14.0", output
  end
end
