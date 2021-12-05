class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.2/riot-gen-2.14.2.zip"
  version "2.14.2"
  sha256 "c7f8f24ccb935ae203ab9054e542851ad7ec79d9e3855d8c2b332fadc079d4f2"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.14.2", output
  end
end
