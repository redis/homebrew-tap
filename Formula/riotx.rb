# Generated with JReleaser 1.16.0 at 2025-02-18T23:44:25.082529791Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.4.2"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx/releases/download/v0.4.2/riotx-standalone-0.4.2-linux-aarch64.zip"
    sha256 "bdfdb640890074ebce575ef091604b212dd3affa5924afa19e05afad2c20de1a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx/releases/download/v0.4.2/riotx-standalone-0.4.2-linux-x86_64.zip"
    sha256 "bf584f0fb214a4b699ea8fbfc174b9d8c2a0c1de7bdb97d1f79ddb60877fcd43"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx/releases/download/v0.4.2/riotx-standalone-0.4.2-osx-aarch64.zip"
    sha256 "c962a052154ba10e6fc25de32b200c102e7b2bb6ddc95796fa957987748d078c"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx/releases/download/v0.4.2/riotx-standalone-0.4.2-osx-x86_64.zip"
    sha256 "48dc6f7610b40838407464f3e57088a6692f84b94a36bb2bde89dc7df119c012"
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
    assert_match "0.4.2", output
  end
end
