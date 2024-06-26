# Generated with JReleaser 1.12.0 at 2024-06-26T14:22:30.636824109Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  url "https://github.com/redis/riot/releases/download/v4.0.4/riot-4.0.4.zip"
  version "4.0.4"
  sha256 "869ca0cf920744e8c3ef737db339598065af4dcd9a671d86b84da2537ea4a6a6"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "4.0.4", output
  end
end
