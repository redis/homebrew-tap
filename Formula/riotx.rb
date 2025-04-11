# Generated with JReleaser 1.17.0 at 2025-04-11T06:25:38.755114261Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.6.3"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.3/riotx-standalone-0.6.3-linux-aarch64.zip"
    sha256 "68f09b3e1ef66cc0b554746bfddfc397ee647c1fbf45b22ae3a8d27bb1687cbb"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.3/riotx-standalone-0.6.3-linux-x86_64.zip"
    sha256 "18a21c00439e593e864d28d766e1722425ca1d2f71e09caab4bfeb2e9083577f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.3/riotx-standalone-0.6.3-osx-aarch64.zip"
    sha256 "fad5b87e9e9f6e3706f77b4342a0d7a35452634f2e23d42c5332d0bece364427"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.6.3/riotx-standalone-0.6.3-osx-x86_64.zip"
    sha256 "c4cb19f08bd17e6a767ffda6e03a839844e1a381b6e76ae339becae4c1d965c9"
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
    assert_match "0.6.3", output
  end
end
