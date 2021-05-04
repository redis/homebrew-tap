class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.1"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.1/riot-db-2.11.1.zip"
  sha256 "48b885703afb7695579b6a396e4aada84bdf34fd146d2cb03a0b71252b1694c6"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.11.1", output
  end
end