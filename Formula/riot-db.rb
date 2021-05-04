class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.0/riot-db-2.11.0.zip"
  sha256 "0de28006afcf4585fb1f495b644cee3c173e5d127fd0b9851e7933f80d9013f1"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.11.0", output
  end
end