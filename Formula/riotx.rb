# Generated with JReleaser 1.24.0 at 2026-06-12T14:28:29.872971482Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.13.0/riotx-1.13.0.zip"
  version "1.13.0"
  sha256 "ef2cf002b3fae312e774601046ffe9c88a1e6c31fc1b0f4ca6e74782bba2d288"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.13.0", output
  end
end
