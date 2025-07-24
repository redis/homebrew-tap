# Generated with JReleaser 1.19.0 at 2025-07-24T22:01:15.390587427Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v0.9.4/riotx-0.9.4.zip"
  version "0.9.4"
  sha256 "e16a5e97a1b143e64855141f960736b55ed87cdd0c54e98a8863582010cef6aa"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "0.9.4", output
  end
end
