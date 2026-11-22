class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.13.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.13.1/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "e347c2b89eb73fc7999a9f3389caf44033944b1751dad267bec37dae1212f76f"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.13.1/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "dae7cffa8d5b5fef274b6d0b344698c42e608d052f0c1027b949889a6ea93a3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.13.1/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9721343d6014ef9fa2bf1f0661259b026f7ba1564d67f12675c7979a58650f95"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.13.1/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d9dedf24a8ad0f01517d859526bdf0d83f0c135877e08cba499287915d2c3b20"
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
