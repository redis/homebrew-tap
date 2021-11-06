class RiotStream < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  version "2.14.0"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.0/riot-stream-2.14.0.zip"
  sha256 "c285826d1ef5331a02b3e3b06f26f85a48ace43dc2ccad3225fa7057fdb28d77"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-stream"
  end

  test do
    output = shell_output("#{bin}/riot-stream --version")
    assert_match "2.14.0", output
  end
end