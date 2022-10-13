# Generated with JReleaser 1.2.0 at 2022-10-13T18:39:56.496308557Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.5/riot-file-2.18.5.zip"
  version "2.18.5"
  sha256 "7ae05c9b7eb926faca22c26f0d0fb0eec0107a7aaaf44412ce3ef7e644cba3d4"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.18.5", output
  end
end
