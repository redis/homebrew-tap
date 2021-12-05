class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.1/riot-gen-2.14.1.zip"
  version "2.14.1"
  sha256 "237562696d795be15c44475f9caf55a225621e8cd9c6b85691d674fce6752190"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.14.1", output
  end
end
