# Generated with JReleaser 1.15.0 at 2024-11-12T22:58:15.161941433Z

class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis/riot"
  version "4.1.7"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis/riot/releases/download/v4.1.7/riot-standalone-4.1.7-linux-aarch64.zip"
    sha256 "7a9de4e2b874d188e7eb12de4900b22ac92548efdd9594b4d6882cae4f86b044"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.7/riot-standalone-4.1.7-linux-x86_64.zip"
    sha256 "e0e1940c84ba83a185ee263d6dd0589eb1cd50b89d83ab8878d4c2a7216e187c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis/riot/releases/download/v4.1.7/riot-standalone-4.1.7-osx-aarch64.zip"
    sha256 "ae793101a8abf04dfa36630c7bed5ed6e7e9411a1208dd0eaff592f38383b2a4"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis/riot/releases/download/v4.1.7/riot-standalone-4.1.7-osx-x86_64.zip"
    sha256 "b8d96e277b7762b373b75c2ef811e9736cea84f4b744a2e3651e0d82c75c825c"
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
    assert_match "4.1.7", output
  end
end
