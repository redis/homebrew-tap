# Generated with JReleaser 1.18.0 at 2025-05-14T05:36:56.076782866Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis-field-engineering/riotx-dist"
  version "0.7.2"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.2/riotx-standalone-0.7.2-linux-aarch64.zip"
    sha256 "7853f875602caaa1d7ed14cd39e00bd52f606748f688275d24aba3126e11f605"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.2/riotx-standalone-0.7.2-linux-x86_64.zip"
    sha256 "4af4829d5337961c2a4414cc5925ff55765233b1c2beca730e8983832809f16a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.2/riotx-standalone-0.7.2-osx-aarch64.zip"
    sha256 "459810be4f36ee5ccdfc0a0b0196b952f287a2c2b3da3c34cba775e67b1d2515"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-field-engineering/riotx-dist/releases/download/v0.7.2/riotx-standalone-0.7.2-osx-x86_64.zip"
    sha256 "39d74e59a491aa8963cd5db325c5fc796e79cb7f09a1885d2a8e661cdedfd5ad"
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
    assert_match "0.7.2", output
  end
end
