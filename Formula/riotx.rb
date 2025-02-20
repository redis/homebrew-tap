# Generated with JReleaser 1.16.0 at 2025-02-20T23:44:15.865877099Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.4.3"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.3/riotx-standalone-0.4.3-linux-aarch64.zip"
    sha256 "c5d5bb8b62984c6141c00acf95bebb77459279acc2c4812e2097e031e3845f3d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.3/riotx-standalone-0.4.3-linux-x86_64.zip"
    sha256 "0ad8bb8d0f9632f431827adad21c44ae72bdb72d4d999b91b71bb64ffac528c7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.3/riotx-standalone-0.4.3-osx-aarch64.zip"
    sha256 "e2db60e5ba139c11ca3271097d34de0417861257f3301351a877ae4759de1fe9"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.4.3/riotx-standalone-0.4.3-osx-x86_64.zip"
    sha256 "a3faef50cffadcc8b0745285f9ad9fa7a1efa021cd13784c9789631c421a2df8"
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
    assert_match "0.4.3", output
  end
end
