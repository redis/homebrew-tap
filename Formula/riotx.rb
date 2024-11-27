# Generated with JReleaser 1.15.0 at 2024-11-27T22:22:50.052721704Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.3.1"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.3.1/riotx-standalone-0.3.1-linux-aarch64.zip"
    sha256 "4a302ff59adf36f2ff2332b4fe387dfa0c005e3f9276a63b392c7dc5190444ad"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.3.1/riotx-standalone-0.3.1-linux-x86_64.zip"
    sha256 "2833522e8800624ca6c47ac3ea79e3d60d9f42529a5b486c9e1633c03343d546"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.3.1/riotx-standalone-0.3.1-osx-aarch64.zip"
    sha256 "086dffc9c7676785bfb3c543a0f1376c2e2882ea32f9033f89415ec4288f88f5"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.3.1/riotx-standalone-0.3.1-osx-x86_64.zip"
    sha256 "1aa4513ffc71b8553a189e628191df707883df64ed57253e78b9090c3bcfcc23"
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
    assert_match "0.3.1", output
  end
end
