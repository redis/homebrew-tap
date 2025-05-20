# Generated with JReleaser 1.18.0 at 2025-05-20T20:31:22.752220584Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.7.3"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.3/riotx-standalone-0.7.3-linux-aarch64.zip"
    sha256 "0c2c88341b68f15e74d6dbe1b78e9e56cbc2ce13eb0ffb080c549f1dc860c75f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.3/riotx-standalone-0.7.3-linux-x86_64.zip"
    sha256 "e0e00287327766c47c97829048b5b220cb0b12a5d2b99a39a661b665eb93f22d"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.3/riotx-standalone-0.7.3-osx-aarch64.zip"
    sha256 "46652d8ffaf7b0781567b552fe193c39d7a44305fc7702ed6629b15f53d68f1f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.3/riotx-standalone-0.7.3-osx-x86_64.zip"
    sha256 "e1ed4770b4fb4006d7a2e8e9cf93880ea8577a5d7732fa467db9e256ec7a79f5"
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
    assert_match "0.7.3", output
  end
end
