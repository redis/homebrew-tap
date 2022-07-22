# Generated with JReleaser 1.1.0 at 2022-07-22T06:07:42.818466081Z
class RiotFile < Formula
  desc "Redis Input/Output Tools"
  homepage "https://developer.redis.com/riot"
  url "https://github.com/redis-developer/riot/releases/download/v2.16.1/riot-file-2.16.1.zip"
  version "2.16.1"
  sha256 "e0feec93061891f9724de2a104a56a0e210c44199865e0fef4d8c512baebaa0c"
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot-file" => "riot-file"
  end

  test do
    output = shell_output("#{bin}/riot-file --version")
    assert_match "2.16.1", output
  end
end
