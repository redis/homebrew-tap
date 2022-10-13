# Generated with JReleaser 1.2.0 at 2022-10-13T18:39:56.496308557Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.5/riot-db-2.18.5.zip"
  version "2.18.5"
  sha256 "7afb389ec1937192046b52e21c85bc537af259b688113c12088160aa7c695b63"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.18.5", output
  end
end
