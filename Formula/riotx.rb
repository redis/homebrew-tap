# Generated with JReleaser 1.22.0 at 2026-01-16T06:41:54.713613821Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.7.8/riotx-1.7.8.zip"
  version "1.7.8"
  sha256 "70178b921914221c7c534ab8494b2e6f21d4e2213f9326bab74bf66eba3580e5"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.7.8", output
  end
end
