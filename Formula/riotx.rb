# Generated with JReleaser 1.19.0 at 2025-07-17T13:44:35.380796706Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.9.1/riotx-0.9.1.zip"
  version "0.9.1"
  sha256 "1945bc4b5ec630192220912f7d6a06f861f74625acce48107063ca83bfda9dbc"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "0.9.1", output
  end
end
