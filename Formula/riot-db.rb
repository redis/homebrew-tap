# Generated with JReleaser 1.0.0 at 2022-05-26T05:20:05.406894Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.5/riot-db-2.15.5.zip"
  version "2.15.5"
  sha256 "fcca67d21a6613a6e3e1df5012f8f7d5cec077fae4bffe37211e69c2e4d97202"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.15.5", output
  end
end
