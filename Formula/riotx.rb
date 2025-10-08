# Generated with JReleaser 1.20.0 at 2025-10-08T04:21:30.867937013Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.7.0/riotx-1.7.0.zip"
  version "1.7.0"
  sha256 "694d2fb0e0e56391ea95a51399718be8a7f16a32a30f82fa3513af0a06f7a8a0"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.7.0", output
  end
end
