class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.1"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.1/riot-file-2.11.1.zip"
  sha256 "636f8b6ae6da79280a8d52496afe3edf1a833731f93a48245aa12efa80ccf42f"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.11.1", output
  end
end