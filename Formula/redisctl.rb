class Redisctl < Formula
  desc "CLI for Redis Cloud and Enterprise management"
  homepage "https://github.com/redis/redisctl"
  version "0.12.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.12.0/redisctl-aarch64-apple-darwin.tar.xz"
      sha256 "233dd253e143c6e1593cc31b0238fdf44962ce3739d0301ca0d31fbc1ad80077"
    end
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.12.0/redisctl-x86_64-apple-darwin.tar.xz"
      sha256 "f30de8dfa31c726245fadfb4984dbb36e7eccfcfb6523be74b313c16ae6cfefd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.12.0/redisctl-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c3a86170206021a4ead74633cb3c69f9aeb71b7bf7f0bc0385dd3aeed291dae5"
    end
  end

  def install
    bin.install "redisctl"
  end

  test do
    assert_match "redisctl", shell_output("#{bin}/redisctl --version")
  end
end
