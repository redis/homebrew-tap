class Redisctl < Formula
  desc "CLI for Redis Cloud and Enterprise management"
  homepage "https://github.com/redis/redisctl"
  version "0.14.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.14.0/redisctl-aarch64-apple-darwin.tar.xz"
      sha256 "be59a85cd1e48a8619ee98107303358b1ffa308a7d0b6d63ecc353c19528678d"
    end
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.14.0/redisctl-x86_64-apple-darwin.tar.xz"
      sha256 "49b329d993618900be520882fde76ce83bc1908b3a3d7e8d29fb8b9db233398c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.14.0/redisctl-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4451ca08e177b251cfda3c7fa5fc88418ebf58d4be02f29f5b7fb51d46af3564"
    end
  end

  def install
    bin.install "redisctl"
  end

  test do
    assert_match "redisctl", shell_output("#{bin}/redisctl --version")
  end
end
