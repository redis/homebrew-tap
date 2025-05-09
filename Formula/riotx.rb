# Generated with JReleaser 1.18.0 at 2025-05-09T06:26:10.339986556Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.7.1"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.1/riotx-standalone-0.7.1-linux-aarch64.zip"
    sha256 "440e9f477533e886ff68f984df34b6ce9b92f749c0683a026aa47b2ffd4a3e54"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.1/riotx-standalone-0.7.1-linux-x86_64.zip"
    sha256 "7bc5c4afb0163f6016000a947c65c3c14c1a1a160a96a47ce54bcbb2c82347d4"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.1/riotx-standalone-0.7.1-osx-aarch64.zip"
    sha256 "8449572e93f9a35bee77c87579a79cb2a773e85e63f16f1eeaffb085ef48fb92"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.1/riotx-standalone-0.7.1-osx-x86_64.zip"
    sha256 "67aba3d2050459d4c1f10b6b8b7ed7609ea56eb4882189d0dadeddfabce030b8"
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
    assert_match "0.7.1", output
  end
end
