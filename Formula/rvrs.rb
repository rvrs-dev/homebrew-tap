class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.9.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.9.0/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "0e6f0da77a624af6851677a15c3c9fe3ecc506471e73591ba075070885e059f2"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.9.0/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "d37eb3abfc1887df22d1bf1c90feaba6bf8691983c5267eb4890992018090319"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.9.0/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "096d605e9a089ed2436ab471b1dd07aabae7aa54d6e3566b12a2b0da09b7648b"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.9.0/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e707c072ebb6c8e6c4315afa0e2266b513852d1d9916d1036f5cf65bd25e48f7"
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
