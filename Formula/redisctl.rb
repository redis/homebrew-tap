class Redisctl < Formula
  desc "CLI for Redis Cloud and Enterprise management"
  homepage "https://github.com/redis/redisctl"
  version "0.11.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.11.1/redisctl-aarch64-apple-darwin.tar.xz"
      sha256 "22a0aaa1d93ee93a365a761eb336c20d3f7f725ff9f7c9ac1a3ce2f6927d5071"
    end
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.11.1/redisctl-x86_64-apple-darwin.tar.xz"
      sha256 "6df9d88d66eb92d5bf26df3e6b6a23c57e29f154f3ee683196183b7119d67885"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.11.1/redisctl-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "99a2496db383c61de2c9dfe730289ede25a1723a512bac166f4390a8db27b761"
    end
  end

  def install
    bin.install "redisctl"
  end

  test do
    assert_match "redisctl", shell_output("#{bin}/redisctl --version")
  end
end
