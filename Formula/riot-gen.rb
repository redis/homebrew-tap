# Generated with JReleaser 1.2.0 at 2022-09-27T05:11:04.381734046Z
class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.4/riot-gen-2.18.4.zip"
  version "2.18.4"
  sha256 "e3ccaf3a19afa796b236b14baf401bfa93299a58694c85320c4ab76bfb042505"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen" => "riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.18.4", output
  end
end
