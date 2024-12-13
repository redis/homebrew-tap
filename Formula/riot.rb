# Generated with JReleaser 1.15.0 at 2024-12-13T06:53:41.782598497Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.1.10"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.1.10/riot-standalone-4.1.10-linux-aarch64.zip"
    sha256 "72cbd7862ab6e2cf2b8267570649c8acadd5334228b28c01b7d41f1372bbd85c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.10/riot-standalone-4.1.10-linux-x86_64.zip"
    sha256 "d09db732b1906463e8cf603e95d1b2a18fdd212d02ff932400c10b7da56eab1a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.1.10/riot-standalone-4.1.10-osx-aarch64.zip"
    sha256 "cb9f8ffd80e48a08b4a5ebf0e4f2e27e37eda5c7d36dc7d1307a031fe7e5b9c0"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.10/riot-standalone-4.1.10-osx-x86_64.zip"
    sha256 "ba6ec876c05ad644ed271ef0cd047de8215e1c999ad296eadf9f9d070c0286c0"
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
    assert_match "4.1.10", output
  end
end
