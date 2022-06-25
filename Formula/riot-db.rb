# Generated with JReleaser 1.0.0 at 2022-06-25T18:40:04.260101Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.0/riot-db-2.16.0.zip"
  version "2.16.0"
  sha256 "c41c85c6694f54524f6b2326047ba1dd927dcf37d574283df79a44e672ac321a"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.16.0", output
  end
end
