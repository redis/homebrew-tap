# Generated with JReleaser 1.25.0 at 2026-07-28T11:05:25.860041718Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.14.2/riotx-1.14.2.zip"
  version "1.14.2"
  sha256 "add31f07eca7f60df021afafb7bd1393def88e688b1fe026c489d28bdaa22946"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.14.2", output
  end
end
