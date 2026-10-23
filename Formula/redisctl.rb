class Redisctl < Formula
  desc "CLI for Redis Cloud and Enterprise management"
  homepage "https://github.com/redis/redisctl"
  version "0.13.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.13.0/redisctl-aarch64-apple-darwin.tar.xz"
      sha256 "9485d8ca4649acedea95be592b7b4968f55156a1d513c559fc7c6a9a755f1804"
    end
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.13.0/redisctl-x86_64-apple-darwin.tar.xz"
      sha256 "965919e8961a7e4e3dc589278837907c102edd03b6fc3c3586510172d3545326"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-v0.13.0/redisctl-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ffa0c00fe44dedc292fe32c6df1edbdf51987b48b9ae21981e5562b9f7d478b5"
    end
  end

  def install
    bin.install "redisctl"
  end

  test do
    assert_match "redisctl", shell_output("#{bin}/redisctl --version")
  end
end
