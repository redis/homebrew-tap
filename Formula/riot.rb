# Generated with JReleaser 1.16.0 at 2025-02-16T18:45:24.233741491Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.2.3"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.2.3/riot-standalone-4.2.3-linux-aarch64.zip"
    sha256 "3dd943c09a4e637fe11c339182cc44f09afa35bfa2a64d1173f24136682d6570"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.2.3/riot-standalone-4.2.3-linux-x86_64.zip"
    sha256 "6720a48ed6a76e4bc2cb1df9c4c2345b7a58abd54f7155e430976787a7a4a101"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.2.3/riot-standalone-4.2.3-osx-aarch64.zip"
    sha256 "cce6d03a916988fde81f350d0b968d1f7349668c49e1c68a34a1034c6bc8b04d"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.2.3/riot-standalone-4.2.3-osx-x86_64.zip"
    sha256 "00a0eebd5adaf9acce2205b0c2c03430a7a1cff9d9c14fd9d17bebd64bbb4cc4"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riot" => "riot"
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
    output = shell_output("#{bin}/riot --version")
    assert_match "4.2.3", output
  end
end
