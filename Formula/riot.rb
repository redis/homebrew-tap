# Generated with JReleaser 1.7.0-SNAPSHOT at 2023-06-01T04:59:07.795381848Z
class Riot < Formula
  desc "Get data in and out of Redis with RIOT"
  homepage "https://github.com/redis-developer/riot"
  version "3.0.0"
  license "Apache-2.0"

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/redis-developer/riot/releases/download/v3.0.0/riot-standalone-3.0.0-linux-aarch64.zip"
    sha256 "5c7db986d0f926871a660af66fb2b6751c8bd6983dc4e09517f8e12cfbec7fe6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/redis-developer/riot/releases/download/v3.0.0/riot-standalone-3.0.0-linux-x86_64.zip"
    sha256 "99fa21b54fa46bed931f68aee4bbfa87b89d5f2635e706ec0d8e9576e5fb4863"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/redis-developer/riot/releases/download/v3.0.0/riot-standalone-3.0.0-osx-aarch64.zip"
    sha256 "ece4eaca927f2da6691e49a778495e56b65e344329d92c98bffce80a2423e08c"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/redis-developer/riot/releases/download/v3.0.0/riot-standalone-3.0.0-osx-x86_64.zip"
    sha256 "f46d7a6bef7e2177db2101ddd568725d3ceed9e72b9e0823029689b5c2ebcd1a"
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
        chmod 0444, dylib
      end
    end
  end

  test do
    output = shell_output("#{bin}/riot --version")
    assert_match "3.0.0", output
  end
end
