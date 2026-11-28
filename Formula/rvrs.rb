class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.17.32"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.32/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "9e9ec4a0699e85c1076290125513446c36f36d017bba7d096ffad2370c7f251e"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.32/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "f438a94cf965de684adfd34934e6f74b8d661b8d86d728058e5933515da57d2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.32/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c1d636d8afd46f57199849f42a3209ca498ee609481a1d4e318d80ae77e7392d"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.32/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6d909d4673c65b06414f5e1c16530656e9ef274a6d40b9d4bfb6df0d0d99bf96"
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
