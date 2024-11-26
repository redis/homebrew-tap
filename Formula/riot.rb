# Generated with JReleaser 1.15.0 at 2024-11-26T20:37:57.228687455Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.1.8"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.1.8/riot-standalone-4.1.8-linux-aarch64.zip"
    sha256 "50556050d5678bce235c3ca638eac944e0e321132907fa1352ef2ebae70dfcf7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.8/riot-standalone-4.1.8-linux-x86_64.zip"
    sha256 "74cca84bf43eafbcb3a0d7213f35e624250ab65c980988117c8d3fd99dfe2e6e"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.1.8/riot-standalone-4.1.8-osx-aarch64.zip"
    sha256 "e4542fd0a63547ad7fbb227a18f8b5865de7bc8567bb2df8d9e555989ffdcd40"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.8/riot-standalone-4.1.8-osx-x86_64.zip"
    sha256 "b578f0d230d8dcb44cfbfbc0222014d2da4a226d8bd3080b1c35f94afa2f2e8f"
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
    assert_match "4.1.8", output
  end
end
