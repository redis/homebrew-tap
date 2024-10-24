# Generated with JReleaser 1.14.0 at 2024-10-24T15:23:12.960395552Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  url "https://github.com/redis/riot/releases/download/v4.1.4/riot-4.1.4.zip"
  version "4.1.4"
  sha256 "9db6da6e32aa8f74033f01cb04a037395ca5c2ecb8956330f1f23d04f6eb0940"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "4.1.4", output
  end
end
