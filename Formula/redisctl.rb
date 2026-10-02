class Redisctl < Formula
  desc "CLI for Redis Cloud and Enterprise management"
  homepage "https://github.com/redis/redisctl"
  version "0.12.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.12.1/redisctl-aarch64-apple-darwin.tar.xz"
      sha256 "1fb7b79ff408c1ecda38ee4f7578caceb4459c389c31ce5f7ebbe835761178a5"
    end
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.12.1/redisctl-x86_64-apple-darwin.tar.xz"
      sha256 "56c444c723016c935fffd871eb8c055a19e1b59723ee34c106be322db8c27d17"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.12.1/redisctl-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "31e1e6a057240f1c5bf319682bf8758d2ef0268c284d53e5aa9d7de99c003df4"
    end
  end

  def install
    bin.install "redisctl"
  end

  test do
    assert_match "redisctl", shell_output("#{bin}/redisctl --version")
  end
end
