# Generated with JReleaser 1.1.0 at 2022-08-16T14:19:19.551284408Z
class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.17.0/riot-db-2.17.0.zip"
  version "2.17.0"
  sha256 "6f1d1d81bd17e985d9ce59fe3cf06bf05d69fb461c53daab70e185daf64b27cb"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db" => "riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.17.0", output
  end
end
