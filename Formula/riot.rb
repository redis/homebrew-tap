# Generated with JReleaser 1.12.0 at 2024-06-12T21:54:46.610930509Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  url "https://github.com/redis/riot/releases/download/v4.0.0/riot-4.0.0.zip"
  version "4.0.0"
  sha256 "112bee01e03d18d16d73b97752a7cc195072bc1d518dcf8495383ae7fe953b38"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "4.0.0", output
  end
end
