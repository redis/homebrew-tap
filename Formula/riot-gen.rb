class RiotGen < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.3/riot-gen-2.14.3.zip"
  version "2.14.3"
  sha256 "805a62cf9daaef7123e278ecc060c45574737ddc491cdc297e3a11ba88296c55"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-gen"
  end

  test do
    output = shell_output("#{bin}/riot-gen --version")
    assert_match "2.14.3", output
  end
end
