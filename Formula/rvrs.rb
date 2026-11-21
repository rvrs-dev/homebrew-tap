class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.11.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.11.1/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "b481c6f125d127e8c50d0443b61ef81d68a53265e39cd82218044c719d90e5d0"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.11.1/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "da4058a0a89b25ea2b0949ef08d20a2b7dacd476947d4c72d9b6be81fc5eb0ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.11.1/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e95d44b26b2a716e2df76142676f6db8c20f151429754a3c0f5520960a28815f"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.11.1/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a00d24fbe98c7be0c8e6570ab95d0a72a516e6dd40810acd1a5481a8650c9ad7"
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
