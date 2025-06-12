# Generated with JReleaser 1.18.0 at 2025-06-12T17:44:49.524716303Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.8.1/riotx-0.8.1.zip"
  version "0.8.1"
  sha256 "42db4680425758b27cbca05d17aa7174aa59b9d3a4dca0014ea8a231feb753a2"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "0.8.1", output
  end
end
