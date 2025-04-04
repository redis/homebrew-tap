# Generated with JReleaser 1.17.0 at 2025-04-04T01:36:11.66740247Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.6.1"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.1/riotx-standalone-0.6.1-linux-aarch64.zip"
    sha256 "38d210698b35ab064967c3b22a28ec4fc5a0dcd522001c4277cbc2b293a27e31"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.1/riotx-standalone-0.6.1-linux-x86_64.zip"
    sha256 "fd93d8245fce52e46d35d4f32968acc71f826c59c6a8f9dac489e3e1aef8592f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.1/riotx-standalone-0.6.1-osx-aarch64.zip"
    sha256 "d217a69d80351f0932b31752a07f063cf12c57e95b2999acb45f33e8663147ed"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.1/riotx-standalone-0.6.1-osx-x86_64.zip"
    sha256 "d4e93d23a51feeeaa1ca3668e02dfb6d33fd319c49d954a1ff095a841225ce75"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
  end

  def post_install
    if OS.mac?
      Dir["#{libexec}/lib/**/*.dylib"].each do |dylib|
        chmod 0664, dylib
        MachO::Tools.change_dylib_id(dylib, "@rpath/#{File.basename(dylib)}")
        MachO.codesign!(dylib)
        chmod 0444, dylib
      end
    end
  end

  test do
    output = shell_output("#{bin}/riotx --version")
    assert_match "0.6.1", output
  end
end
