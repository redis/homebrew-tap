# Generated with JReleaser 1.17.0 at 2025-03-24T14:40:44.011452229Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.5.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.5.0/riotx-standalone-0.5.0-linux-aarch64.zip"
    sha256 "0412278d71caacce69b3e84fcab543e1162e6ba1b2789cdc7ad3b9132ab69433"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.5.0/riotx-standalone-0.5.0-linux-x86_64.zip"
    sha256 "44ce59e3807ff9d78d93bcbc75aeb817472371682dae91a098526af101c068a1"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.5.0/riotx-standalone-0.5.0-osx-aarch64.zip"
    sha256 "634a01306a478ff32e8457dff5d74de2073440832ed1c7857ab32f6cbeab3f1f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.5.0/riotx-standalone-0.5.0-osx-x86_64.zip"
    sha256 "a581c2287620e6852037e6c99a895b10395f8b8a0bbb09fd6ae51a29d4d68b62"
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
    assert_match "0.5.0", output
  end
end
