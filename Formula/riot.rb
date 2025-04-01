# Generated with JReleaser 1.17.0 at 2025-04-01T00:28:44.050010542Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.3.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.3.0/riot-standalone-4.3.0-linux-aarch64.zip"
    sha256 "0675bd9061d98ca90f5d864f27c15ece6c3585594d08ecdb32d79727f6f44d6e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.3.0/riot-standalone-4.3.0-linux-x86_64.zip"
    sha256 "89566f85ebc66cf4bd20c7b33ebd9f818de532b3acc5317279809e67f0db9d09"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.3.0/riot-standalone-4.3.0-osx-aarch64.zip"
    sha256 "b71f27520c4c5e8d325df64a5c8e42355f148fb4915d73ef1e4b68c4643a8009"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.3.0/riot-standalone-4.3.0-osx-x86_64.zip"
    sha256 "ea66b46904687654d5b2f94193babd19c3013f72660c00611e0c49262c7babe7"
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
    assert_match "4.3.0", output
  end
end
