# Generated with JReleaser 1.15.0 at 2024-11-27T07:24:13.335821513Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.3.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.3.0/riotx-standalone-0.3.0-linux-aarch64.zip"
    sha256 "052b5fb895842cccfe0cdc0122dd5fa9ae9f53916b5b12e471c6319a1e77b620"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.3.0/riotx-standalone-0.3.0-linux-x86_64.zip"
    sha256 "e10877db90bae0de243a9f29a3f6c08412402045810ca72f82dbd1a77db26d57"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.3.0/riotx-standalone-0.3.0-osx-aarch64.zip"
    sha256 "647b8b9152dbf0f33ecd8a75a4b3f69ff3dc59905676e795c2932bb5e3c50d1f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.3.0/riotx-standalone-0.3.0-osx-x86_64.zip"
    sha256 "52ecd72d5791bc8cc8a0c7da5f32519f73bf5087c2c3598e8e14ec2cb4566d95"
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
    assert_match "0.3.0", output
  end
end
