# Generated with JReleaser 1.17.0 at 2025-04-03T22:54:30.381925511Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.6.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.0/riotx-standalone-0.6.0-linux-aarch64.zip"
    sha256 "52309d86d21b7bc9ee299451d12b51d3dcb12129b93f1124a38f8fd9c8f9bb7b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.0/riotx-standalone-0.6.0-linux-x86_64.zip"
    sha256 "4c68ea79be2cb299b7af39cec265662351143eb78abece9d61649ab7cd28179e"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.0/riotx-standalone-0.6.0-osx-aarch64.zip"
    sha256 "1207428301711011fc60008869b8bb830c0f2472160a501fa78c90be62ce09fb"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.0/riotx-standalone-0.6.0-osx-x86_64.zip"
    sha256 "67dff44f29bdf1ceedeb68818cacc83f1ec14c906421991a6f7aaf30035c774e"
  end


  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/riotx" => "riotx"
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
    output = shell_output("#{bin}/riotx --version")
    assert_match "0.6.0", output
  end
end
