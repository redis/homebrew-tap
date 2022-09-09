# Generated with JReleaser 1.2.0 at 2022-09-09T05:28:02.600672155Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.1/riot-db-2.18.1.zip"
  version "2.18.1"
  sha256 "c8919fb8f9578cccfa02c7c54221bc0c1517855e28c48935b29142c3b4327c3f"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.18.1", output
  end
end
