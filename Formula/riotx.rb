# Generated with JReleaser 1.18.0 at 2025-05-09T05:52:17.810706127Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.7.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.0/riotx-standalone-0.7.0-linux-aarch64.zip"
    sha256 "4a1b2cba7cd873bf67f03f3ad1bd7aaae41cb7fc1b8679128d72dd70adce8897"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.0/riotx-standalone-0.7.0-linux-x86_64.zip"
    sha256 "951e71ce8d52c768e1126893e448a18472e60706fb7153259684fb97aa165e20"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.0/riotx-standalone-0.7.0-osx-aarch64.zip"
    sha256 "532c221993951a20f305e05f336c07fee7003cad689cb38df3e3658f941f0718"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.0/riotx-standalone-0.7.0-osx-x86_64.zip"
    sha256 "51e3bf8e8d105c2f629353b588e102c4178b63c75edc8078063660ff69dc1600"
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
    assert_match "0.7.0", output
  end
end
