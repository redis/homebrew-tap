# Generated with JReleaser 1.19.0 at 2025-08-07T23:19:54.497766799Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.2.0/riotx-1.2.0.zip"
  version "1.2.0"
  sha256 "2cba8bda0f2db830ef657524cecb072a78e034171474c4b206f59080ff2c9269"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.2.0", output
  end
end
