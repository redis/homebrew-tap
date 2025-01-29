# Generated with JReleaser 1.16.0 at 2025-01-29T02:01:24.252931461Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.2.1"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.2.1/riot-standalone-4.2.1-linux-aarch64.zip"
    sha256 "b2e36b7ea870b3f8edf26835bd6384df608c113502b3dc851e2dd8f5a1c72be7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.2.1/riot-standalone-4.2.1-linux-x86_64.zip"
    sha256 "f6a8fea0cb7a0136b7f85fe57df6a00f0c4be433bafe76456eb31b9134ebd880"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.2.1/riot-standalone-4.2.1-osx-aarch64.zip"
    sha256 "d2015c97d5f375784b5a242ec154b88649a4df9b2122711986a54197951ff83f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.2.1/riot-standalone-4.2.1-osx-x86_64.zip"
    sha256 "464f6b63adb911fa55839fbce25d6bad99cc1e9923fca7acdc9489fac86597bf"
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
    assert_match "4.2.1", output
  end
end
