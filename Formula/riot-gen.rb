class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.1"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.1/riot-gen-2.11.1.zip"
  sha256 "7e0584d78eca355756a8b64978664f9b9fce9633aa5977cbe00915778d470703"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.11.1", output
  end
end