class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.0/riot-stream-2.11.0.zip"
  sha256 "993730476435367d61fba2ca355f0e175228342dcede923b9511a19d18b219a7"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.11.0", output
  end
end