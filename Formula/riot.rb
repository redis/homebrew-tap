# Generated with JReleaser 1.8.0-SNAPSHOT at 2023-07-05T23:49:08.84095428Z
class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  url "https://github.com/redis-developer/riot/releases/download/v3.1.2/riot-3.1.2.zip"
  version "3.1.2"
  sha256 "2557e6d16662d626a133c887b5bc8e9560ad9dac9b969df13fca982dd5553ee5"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.1.2", output
  end
end
