class RiotRedis < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redislabs.com/riot"
  version "2.11.2"
  url "https://github.com/redis-developer/riot/releases/download/v2.11.2/riot-redis-2.11.2.zip"
  sha256 "aa79c52997f26f08d0a1c2de510b128818667d5bf54071a36d9562bf41af7579"
  license "Apache-2.0"

  bottle :unneeded

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-redis"
  end

  test do
    output = shell_output("#{bin}/riot-redis --version")
    assert_match "2.11.2", output
  end
end