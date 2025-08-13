# Generated with JReleaser 1.19.0 at 2025-08-13T18:52:41.52739274Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.3.2/riotx-1.3.2.zip"
  version "1.3.2"
  sha256 "4a1cdf79b9c3629b53d162d7678917a802eebc69fce4bb7431d581648bc797af"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.3.2", output
  end
end
