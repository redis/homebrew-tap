class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.3/riot-db-2.14.3.zip"
  version "2.14.3"
  sha256 "3cba55923285a5a8f30b52619ba46c75e539c23161dca62d280ac75b7f5311b1"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.14.3", output
  end
end
