# Generated with JReleaser 1.17.0 at 2025-04-04T07:38:19.797003302Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.6.2"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.2/riotx-standalone-0.6.2-linux-aarch64.zip"
    sha256 "f59d8e38404ac847f6b3af9f2f8048ed6b5cd243952e966b00f53347e7000235"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.2/riotx-standalone-0.6.2-linux-x86_64.zip"
    sha256 "df81fe2c5c502e2e35ed38484fc2a563245ba78999b1f7f6343fbca144837ec8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.2/riotx-standalone-0.6.2-osx-aarch64.zip"
    sha256 "67daa929d9a295949e15de4298a7e8a671f6d540eacbd7fef5874a7405cbdced"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.2/riotx-standalone-0.6.2-osx-x86_64.zip"
    sha256 "9e7f98e3874f9fd28e0768762242743336d5c2a65a69dd59c8cfd7f679ceb421"
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
    assert_match "0.6.2", output
  end
end
