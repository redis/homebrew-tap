# Generated with JReleaser 1.16.0 at 2025-01-16T05:39:00.008727307Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.4.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.0/riotx-standalone-0.4.0-linux-aarch64.zip"
    sha256 "e6e55f9035fce13961d5fc5125c0093b1d4832e94d8c2b9d20a97ce54f1528d4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.0/riotx-standalone-0.4.0-linux-x86_64.zip"
    sha256 "b64d32624e9a256fa9dee08016f827cdefc3344c947cb50cf5fcb84b72c6394f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.0/riotx-standalone-0.4.0-osx-aarch64.zip"
    sha256 "36efe70bdff3d359868ad2552e2b397b9ff8e884df5b908c62b1b9c3dde4affd"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.0/riotx-standalone-0.4.0-osx-x86_64.zip"
    sha256 "413d6237e7ead8a10c20665367d29c42ad8a5037e71a49ca1bae66cac17e04ee"
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
    assert_match "0.4.0", output
  end
end
