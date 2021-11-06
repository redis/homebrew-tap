class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  version "2.14.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.0/riot-gen-2.14.0.zip"
  sha256 "f1255cb849da172874b2ec6ca56d26fbc9dd9dfe73a4a7108fdec236ac656b76"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.14.0", output
  end
end