# Generated with JReleaser 1.2.0 at 2022-09-15T04:25:36.244421115Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.2/riot-db-2.18.2.zip"
  version "2.18.2"
  sha256 "bb24e7ab83dde9a5428acb1ad010f8275f1da7b523edf07da2d25213810f9793"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.18.2", output
  end
end
