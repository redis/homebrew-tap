class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.2"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.2/riot-gen-2.11.2.zip"
  sha256 "a7cf7e03b96c17fdf0e417eda628e14657aa8bbea0e1ad9509c88204b345c4d3"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.11.2", output
  end
end