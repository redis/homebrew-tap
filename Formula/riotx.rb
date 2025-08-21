# Generated with JReleaser 1.19.0 at 2025-08-21T00:14:57.893697259Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.4.1/riotx-1.4.1.zip"
  version "1.4.1"
  sha256 "c7692b27f28dfa5cc5ba580e7047c5235020a0bee15c87d78f52aefd9ad6d7da"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.4.1", output
  end
end
