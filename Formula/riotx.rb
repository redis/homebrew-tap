# Generated with JReleaser 1.22.0 at 2026-01-16T01:31:39.241181986Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "/v1.7.7/riotx-1.7.7.zip"
  version "1.7.7"
  sha256 "1a2110c5984412f0c80b6eb5143c0048587242af4363a8edb66b733df25278b4"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.7.7", output
  end
end
