class RedisctlMcp < Formula
  desc "MCP server for AI-powered Redis management"
  homepage "https://github.com/redis/redisctl"
  version "0.13.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.13.0/redisctl-mcp-aarch64-apple-darwin.tar.xz"
      sha256 "fd57c4d6d3b0960d8cfdadeccddd67daa5fb6365a57ac8b2db4f04a6f83c10de"
    end
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.13.0/redisctl-mcp-x86_64-apple-darwin.tar.xz"
      sha256 "acfc741fee59d396be9a89df4e1f306a49f3606cad554f92df4053ae5514af09"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/redis/redisctl/releases/download/redisctl-mcp-v0.13.0/redisctl-mcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6014d006bd0bc4335e23a106a11c2897f463b1964e10c6a7c419259f2cb503d0"
    end
  end

  def install
    bin.install "redisctl-mcp"
  end

  test do
    assert_match "redisctl-mcp", shell_output("#{bin}/redisctl-mcp --version")
  end
end
