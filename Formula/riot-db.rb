class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.12.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.12.0/riot-db-2.12.0.zip"
  sha256 "9d581f60e22a768ab96a6cf345eb042eefafc5eacf60a3957c3ee5f8cf631f92"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@11"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.12.0", output
  end
end