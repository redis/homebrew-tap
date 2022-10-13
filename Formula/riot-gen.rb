# Generated with JReleaser 1.2.0 at 2022-10-13T18:39:56.496308557Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.5/riot-gen-2.18.5.zip"
  version "2.18.5"
  sha256 "bdf4e8b34ad8833510cb18db2da2784618473db3285d598fecf74b36278a8721"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.18.5", output
  end
end
