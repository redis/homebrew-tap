class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.3/riot-stream-2.14.3.zip"
  version "2.14.3"
  sha256 "5c9f6ed595e6d338f61aceb9d18b7951a818f628abc5c4e85224cf5b7be28a69"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.14.3", output
  end
end
