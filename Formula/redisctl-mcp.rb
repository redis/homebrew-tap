class RedisctlMcp < Formula
  desc "MCP server for AI-powered Redis management"
  homepage "https://github.com/redis/redisctl"
  version "0.14.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.14.0/redisctl-mcp-aarch64-apple-darwin.tar.xz"
      sha256 "5619729b7d94ebeb85734ed4775eac775ae3891d6c235428564c556334e39306"
    end
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.14.0/redisctl-mcp-x86_64-apple-darwin.tar.xz"
      sha256 "8dc4e7ef15c8070558b2535f1981b494dd785bbe1de9a60d69ee4180a6c0fd7b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.14.0/redisctl-mcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8f4004deecadb9ef4d5238cc20b1c707e5784f2dde4ce32c0d091dbcf628c12b"
    end
  end

  def install
    bin.install "redisctl-mcp"
  end

  test do
    assert_match "redisctl-mcp", shell_output("#{bin}/redisctl-mcp --version")
  end
end
