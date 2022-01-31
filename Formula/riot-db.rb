# Generated with JReleaser 1.0.0-M1 at 2022-01-31T22:28:54.136986Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.15.1/riot-db-2.15.1.zip"
  version "2.15.1"
  sha256 "bff207d76d7612d384077ea2ef18c65246c5af9026ba3108d74e54840fdcde19"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.15.1", output
  end
end
