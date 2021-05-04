class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.2"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.2/riot-stream-2.11.2.zip"
  sha256 "489881eb521be07c6257d251188a630244eb456e6c753f57ddaea10e8a8d9733"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.11.2", output
  end
end