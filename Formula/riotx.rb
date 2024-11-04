# Generated with JReleaser 1.15.0 at 2024-11-04T18:02:15.215383844Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.2.2"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.2.2/riotx-standalone-0.2.2-linux-aarch64.zip"
    sha256 "89929722fa8d813f446ec8f5cb18f290ff1e3b5ab32e313363a8a4b0975c2f81"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.2.2/riotx-standalone-0.2.2-linux-x86_64.zip"
    sha256 "23f6dc672bdf20dc47a8efc569600ade94c2796fe1881a87fa1aa5df46854c34"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.2.2/riotx-standalone-0.2.2-osx-aarch64.zip"
    sha256 "b381928f8d7650c1b9bea33987b0719347f33ec81d84b9a64f509744337b6497"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.2.2/riotx-standalone-0.2.2-osx-x86_64.zip"
    sha256 "48992b6969638b40a4391ed25cd2e40f053c9d3582a089a1216b9d5088951bc0"
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
    assert_match "0.2.2", output
  end
end
