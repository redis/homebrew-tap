class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.12.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.12.0/riot-file-2.12.0.zip"
  sha256 "387af48468513e26665c0777543625d4f0aed989f02b5f76af11c187800a05e5"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@11"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.12.0", output
  end
end