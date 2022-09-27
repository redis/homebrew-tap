# Generated with JReleaser 1.2.0 at 2022-09-27T05:11:04.381734046Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.18.4/riot-file-2.18.4.zip"
  version "2.18.4"
  sha256 "286541b8ef82ddd60670248ecde439e05a72df7fc06f07f64489c0afb59691dd"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.18.4", output
  end
end
