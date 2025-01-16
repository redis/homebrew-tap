# Generated with JReleaser 1.16.0 at 2025-01-16T02:03:24.236946718Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.2.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.2.0/riot-standalone-4.2.0-linux-aarch64.zip"
    sha256 "0cfe553134d768b7c9187646525c83f65dfd7516eda4de68880cf9941c2752b2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.2.0/riot-standalone-4.2.0-linux-x86_64.zip"
    sha256 "f7261afdad1ab779767bce4adc08f8077bbd4ae1b42cc9b3c212d030d4f95f16"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.2.0/riot-standalone-4.2.0-osx-aarch64.zip"
    sha256 "068f54cbc1e3c16cc05800fc53924b0696bf948210a6b12144fcd09b9076ff5e"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.2.0/riot-standalone-4.2.0-osx-x86_64.zip"
    sha256 "99c302fb2565856cf0a79f83b71b8d0d52dcad6ff95c2c9055b17dd20e18cbe3"
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
    assert_match "4.2.0", output
  end
end
