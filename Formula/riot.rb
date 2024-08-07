# Generated with JReleaser 1.13.1 at 2024-08-07T06:48:46.014142928Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  url "https://github.com/redis/riot/releases/download/v4.1.0/riot-4.1.0.zip"
  version "4.1.0"
  sha256 "aa9434f69139b3e9bfcef005b443774fe0e942f537e2fcc9034a2cd96616dac9"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "4.1.0", output
  end
end
