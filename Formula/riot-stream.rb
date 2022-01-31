# Generated with JReleaser 1.0.0-M1 at 2022-01-31T22:28:54.136986Z
class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.1/riot-stream-2.15.1.zip"
  version "2.15.1"
  sha256 "159bc4b8f4412554d36234efa8b2ff56a85e04eb0b0c46432c2d49e0b544b780"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.15.1", output
  end
end
