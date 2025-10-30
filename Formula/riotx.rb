# Generated with JReleaser 1.20.0 at 2025-10-30T23:24:03.904774003Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.7.1/riotx-1.7.1.zip"
  version "1.7.1"
  sha256 "29426233c32dbb7c9654c76a87e628128742a190050a790fe99152f713c23162"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.7.1", output
  end
end
