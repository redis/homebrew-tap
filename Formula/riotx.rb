# Generated with JReleaser 1.18.0 at 2025-06-27T12:27:55.070120749Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.8.3/riotx-0.8.3.zip"
  version "0.8.3"
  sha256 "1b6f7a73f600f43144442909ef5b714d0400f207a2fa8cae38a5602b03246788"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "0.8.3", output
  end
end
