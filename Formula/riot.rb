# Generated with JReleaser 1.15.0 at 2024-11-04T06:49:10.268229385Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.1.6"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.1.6/riot-standalone-4.1.6-linux-aarch64.zip"
    sha256 "a359e8976602ae5500ddcdad75cd65d9fd03e37bd0da91265483b774523936fc"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.6/riot-standalone-4.1.6-linux-x86_64.zip"
    sha256 "0bd99e0ba61b78fcbee511b6f200fa146a718841219bcf739e4aedfe34ebad91"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.1.6/riot-standalone-4.1.6-osx-aarch64.zip"
    sha256 "6fdef3155047d921972737a7b954ea2e8fb2ffa13ace43a17c2f12b29082bfa1"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.6/riot-standalone-4.1.6-osx-x86_64.zip"
    sha256 "7a7139654688e5e24f3bb0a90162384cf251b2e98ea65d15fba4b62279de9bcf"
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
    assert_match "4.1.6", output
  end
end
