class RedisctlMcp < Formula
  desc "MCP server for AI-powered Redis management"
  homepage "https://github.com/redis/redisctl"
  version "0.12.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.12.1/redisctl-mcp-aarch64-apple-darwin.tar.xz"
      sha256 "81a7dcee105c6fa0cec6628a732e376a831105167014a201d0308e137ad2c7b9"
    end
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.12.1/redisctl-mcp-x86_64-apple-darwin.tar.xz"
      sha256 "a13840a2f0fbfb6177043ce0c7b54c7659d09ae4a56bec480f68efd71b25e383"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.12.1/redisctl-mcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d9c561441dbf0d7a67659f76edfd635aaa2e68d896d7aafd0a0a72f5a018dbe1"
    end
  end

  def install
    bin.install "redisctl-mcp"
  end

  test do
    assert_match "redisctl-mcp", shell_output("#{bin}/redisctl-mcp --version")
  end
end
