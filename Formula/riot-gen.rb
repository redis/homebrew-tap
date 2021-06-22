class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.12.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.12.0/riot-gen-2.12.0.zip"
  sha256 "d8a608bc847a997ccf609267944955501807c97c0e5aac4d7ccd5dc2596bd15f"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@11"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.12.0", output
  end
end