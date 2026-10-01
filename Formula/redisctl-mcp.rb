class RedisctlMcp < Formula
  desc "MCP server for AI-powered Redis management"
  homepage "https://github.com/redis/redisctl"
  version "0.12.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.12.0/redisctl-mcp-aarch64-apple-darwin.tar.xz"
      sha256 "2ad84b583d5855d0ed9973eb8e5983d6c2924f5f56b235f0f2f27410dc423d64"
    end
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.12.0/redisctl-mcp-x86_64-apple-darwin.tar.xz"
      sha256 "8f9695087968d4bc792a327b3c6f12f3f31dce3a9b30e3121093fffb4e78a24b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.12.0/redisctl-mcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "dbb3d8a1e08a6b523f22b70d9d70399cd63a5cca07d989311556e027aed26804"
    end
  end

  def install
    bin.install "redisctl-mcp"
  end

  test do
    assert_match "redisctl-mcp", shell_output("#{bin}/redisctl-mcp --version")
  end
end
