# Generated with JReleaser 1.16.0 at 2025-01-30T06:26:57.126369568Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.4.1"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.1/riotx-standalone-0.4.1-linux-aarch64.zip"
    sha256 "1caf221a97efd5dbc69685fd27846a0ab20a89a6a0d8b148d6e14879a088a24a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.1/riotx-standalone-0.4.1-linux-x86_64.zip"
    sha256 "f611e680dfbbbf402751d898a54d4a7911bbdb1834efb23b47d0b59e1f3d4824"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.1/riotx-standalone-0.4.1-osx-aarch64.zip"
    sha256 "c626eb0bc9a2f8ae9e35b0d07603122951ea3d13888d02641275cbc205b1f458"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.1/riotx-standalone-0.4.1-osx-x86_64.zip"
    sha256 "e384719b604cb6eac96aca5d874ec0b297f81a61abc421189e0831f33b7aa683"
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
    assert_match "0.4.1", output
  end
end
