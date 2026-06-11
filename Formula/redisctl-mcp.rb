class RedisctlMcp < Formula
  desc "MCP server for AI-powered Redis management"
  homepage "https://github.com/redis/redisctl"
  version "0.11.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.11.1/redisctl-mcp-aarch64-apple-darwin.tar.xz"
      sha256 "932a1269654bb80f714001f5831cd820944e327937bbe7252e5ced01bbb312be"
    end
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.11.1/redisctl-mcp-x86_64-apple-darwin.tar.xz"
      sha256 "bf83160cf6aff630cb8518a3a598fdb798d9ff3e7a82a7f38c3ba70dc072ab1d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.11.1/redisctl-mcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4b696d69e247f616f2a2c42349c3082f7d4882c4fd25e71e4303d3b2cb8d87b7"
    end
  end

  def install
    bin.install "redisctl-mcp"
  end

  test do
    assert_match "redisctl-mcp", shell_output("#{bin}/redisctl-mcp --version")
  end
end
