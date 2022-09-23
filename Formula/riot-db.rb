# Generated with JReleaser 1.2.0 at 2022-09-23T03:36:54.632777695Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.3/riot-db-2.18.3.zip"
  version "2.18.3"
  sha256 "ce1160dae5871da156c70f9345d5bc77378e1e7dc1dc5acc9609fbfb563b5b5e"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.18.3", output
  end
end
