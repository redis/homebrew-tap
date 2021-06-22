class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.12.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.12.0/riot-stream-2.12.0.zip"
  sha256 "01442c18a31a199983a02bf524a52c78c61d91edd19966344707fd9675e5b4d1"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@11"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.12.0", output
  end
end