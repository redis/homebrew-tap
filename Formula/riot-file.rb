class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.0/riot-file-2.11.0.zip"
  sha256 "50112d11f4fdecf0312cd8b1f8ef3164206d870736569e0e80fa9c43c8fc3c5d"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.11.0", output
  end
end