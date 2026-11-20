class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.7.0/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "31f9ba6bf37eecf5f697aff8c261c3bde4adff580715cfadb1a72b552144306f"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.7.0/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "2a79b6446070774a4659bf7046aedbe6b19d7002a8f8e3197310b873a161d14b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.7.0/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "eebde7ad7c36635b725fcc0c7a9a77dec6a5e87e4259aba21e9914d777178124"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.7.0/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "94aa9cae6fff95150c1e8829eb74b43f8aedbe21cc5feba0a08fe0ae883780f8"
    end
  end

  def install
    bin.install "rvrs"
    generate_completions_from_executable(bin/"rvrs", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rvrs --version")
  end
end
