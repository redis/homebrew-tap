class RiotDb < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.14.1/riot-db-2.14.1.zip"
  version "2.14.1"
  sha256 "1e787fa59c74c0fa372e1fb37fb7f6f355cf2295f1d881755c8e233af2aca3b0"
  license "Apache-2.0"

  depends_on "openjdk@8"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-db"
  end

  test do
    output = shell_output("#{bin}/riot-db --version")
    assert_match "2.14.1", output
  end
end
