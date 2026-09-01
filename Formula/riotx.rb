# Generated with JReleaser 1.25.0 at 2026-07-28T11:05:25.860041718Z

class Riotx < Formula
  desc "Get data in and out of Redis with RIOT-X"
  homepage "https://github.com/redis/riotx"
  version "1.14.2"
  revision 1
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riotx-dist/releases/download/v1.14.2/riotx-standalone-1.14.2-linux-aarch64.zip"
    sha256 "add88d878415984407df8136976abdc43113917b1c7371a01cad235f511758da"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riotx-dist/releases/download/v1.14.2/riotx-standalone-1.14.2-linux-x86_64.zip"
    sha256 "d9e07c713cb3563808ae124a3cc4f994228a8be2fec65c0c0259a4a1efc792b1"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riotx-dist/releases/download/v1.14.2/riotx-standalone-1.14.2-osx-aarch64.zip"
    sha256 "c93b82094f71c310af65b15130d1144876800fd3312cd77da82b082145ec6827"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riotx-dist/releases/download/v1.14.2/riotx-standalone-1.14.2-osx-x86_64.zip"
    sha256 "ef86c529ab67def14b87bf23ac83a1a7b60162e3fb584ba18230925a80d94ec8"
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
    assert_match "1.14.2", output
  end
end
