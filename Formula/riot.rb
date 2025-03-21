# Generated with JReleaser 1.17.0 at 2025-03-21T16:49:12.916570449Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.2.4"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.2.4/riot-standalone-4.2.4-linux-aarch64.zip"
    sha256 "7b05f46170c8d5d2f3bad27ed1a398905a7d656c33ec44a163693790099c7064"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.2.4/riot-standalone-4.2.4-linux-x86_64.zip"
    sha256 "bd4c59ed4d19eaf50bce96777efceced96ed2dc4c4e328e95c2ae2f3734bef31"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.2.4/riot-standalone-4.2.4-osx-aarch64.zip"
    sha256 "b841a15f7e288f362a7727c5573add14c6272c3161f3caef57251b8b94f1ca4f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.2.4/riot-standalone-4.2.4-osx-x86_64.zip"
    sha256 "183b3414c5b77026e5e8b5a4011e9ad221cf8127f4642ad8f7f600b0af20fdef"
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
    assert_match "4.2.4", output
  end
end
