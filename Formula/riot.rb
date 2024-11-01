# Generated with JReleaser 1.15.0 at 2024-11-01T15:57:15.270384388Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.1.5"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.1.5/riot-standalone-4.1.5-linux-aarch64.zip"
    sha256 "4f0b247bf0b4f323c4fe6626dd949ed244a2abea190f5c5bcd9b5e4c519cedd2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.5/riot-standalone-4.1.5-linux-x86_64.zip"
    sha256 "ed23f48b9ca3de05d435efd1777d4120062765f2bb2ffeaa9dea946443aabdde"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.1.5/riot-standalone-4.1.5-osx-aarch64.zip"
    sha256 "5f2db6eefb8c6e3926073381bb95a72ce40992b498727feacd35fa0eec080df4"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.5/riot-standalone-4.1.5-osx-x86_64.zip"
    sha256 "999ce26d24264fe85ee36cbdc401079f3104f9f2de173573f6ab1c526a4854f3"
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
    assert_match "4.1.5", output
  end
end
