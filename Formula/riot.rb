# Generated with JReleaser 1.16.0 at 2025-01-30T02:36:28.945873482Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.2.2"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.2.2/riot-standalone-4.2.2-linux-aarch64.zip"
    sha256 "995ffadf80b68cd6fcef1cdfb487e0ba9ec816daba76589cf21e14d066c12185"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.2.2/riot-standalone-4.2.2-linux-x86_64.zip"
    sha256 "3a749ade742ed33dd536e70bdcd4d5e2d2bae30553a7904961b4c51834797f8d"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.2.2/riot-standalone-4.2.2-osx-aarch64.zip"
    sha256 "bb1c65546d7eb79a5968123edf24fefd51bed4d2a693ed7279425536c9c4e59c"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.2.2/riot-standalone-4.2.2-osx-x86_64.zip"
    sha256 "193816bdd31bc3e10d022db2ba8eb2a3f7fb951c728a562fa51a5388f0d237ee"
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
    assert_match "4.2.2", output
  end
end
