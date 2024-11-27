# Generated with JReleaser 1.15.0 at 2024-11-27T21:19:49.271814635Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.1.9"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.1.9/riot-standalone-4.1.9-linux-aarch64.zip"
    sha256 "71ad6703541060c5e9a4cbb1dae2553a0f3e34dd7a3fc0f523d90c2d4653ff05"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.9/riot-standalone-4.1.9-linux-x86_64.zip"
    sha256 "9a370f625ceffdafc6e1c8384e350958fc0b8b8bd8ad53b6411f92aedb89fa77"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.1.9/riot-standalone-4.1.9-osx-aarch64.zip"
    sha256 "9b1c45d3d86dc4a71fbf8b020a9b0552a589394737850b3d82a505f827ffdf17"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.9/riot-standalone-4.1.9-osx-x86_64.zip"
    sha256 "9d2b0491016fe13d96812ce40441378bc3d8fbdfe6699f49e2f130deb607f9c2"
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
    assert_match "4.1.9", output
  end
end
