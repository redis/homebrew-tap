# Generated with JReleaser 1.20.0 at 2025-09-12T21:37:45.077951767Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx-dist"
  url "https://github.com/redis/riotx-dist/releases/download/v1.5.5/riotx-1.5.5.zip"
  version "1.5.5"
  sha256 "d682328c36e8eff8b061ecd4b39810be329cf1d052f606dea6268221f48acb9f"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.5.5", output
  end
end
