# Generated with JReleaser 1.0.0 at 2022-05-26T05:20:05.406894Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.5/riot-gen-2.15.5.zip"
  version "2.15.5"
  sha256 "59bb3421a4f56b50b85f5c63b36a5e6e9a59cdf75b98c159c345c061134f1073"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.15.5", output
  end
end
