class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  version "2.14.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.0/riot-file-2.14.0.zip"
  sha256 "d8a79350bd66bc11907cc078451d253d48845b8ca4764831b393742d7215febf"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.14.0", output
  end
end