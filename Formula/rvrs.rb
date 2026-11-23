class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.15.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.15.5/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "23f9b9dda948b42561851451dbc85688d06fd812b539265e6a888d0b1a1aba89"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.15.5/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "92daed67faa858aec4746de1b57af48a8658f74c8018558e628c0c91afe6e5ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.15.5/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9bab0888a91333b934a0feedb478625bfae758d9b0594f1bb0502a0871cadb03"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.15.5/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d94cfc7d343026cf698d312433a0c0724d97a97117fb9d48b6b8917a52f1275e"
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
