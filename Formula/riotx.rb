# Generated with JReleaser 1.25.0 at 2026-07-28T11:05:25.860041718Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  url "https://github.com/redis/riotx-dist/releases/download/v1.14.2/riotx-1.14.2.zip"
  version "1.14.2"
  sha256 "a4f26c6d2727a7af42c8e9245e45ce18a78739c4acce6858d970fc0039a6fa93"
  revision 1
  license "Apache-2.0"

  depends_on "openjdk@17"

  def install
    libexec.install Dir["*"]
    (bin/"riotx").write_env_script libexec/"bin/riotx", Language::Java.overridable_java_home_env("17")
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "1.14.2", output
    assert_match "JVM:          17.", output
  end
end
