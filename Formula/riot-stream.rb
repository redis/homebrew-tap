class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.2/riot-stream-2.14.2.zip"
  version "2.14.2"
  sha256 "48e09d72b5a5f6e990c3b18ed070781f9d80d04338ad6a781ba752d32b7c1749"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.14.2", output
  end
end
