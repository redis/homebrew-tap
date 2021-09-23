class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  version "2.13.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.13.0/riot-file-2.13.0.zip"
  sha256 "ec6b4af109ca4a344809e9844d05812dd44f8aeff12a232ee0ba13e77261d8ac"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.13.0", output
  end
end