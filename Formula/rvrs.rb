class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.17.19"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.19/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "246e7ad898721cfef1d62a2dffec03a5713bc1096b89bfd28d2efe27a278b555"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.19/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "963797feda47550c86f66ec99373e1ea623cd7cca3d4b051e3566d40c0a328d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.19/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e8d052268059bb2abe69b0f464988e3260216b5b9febff14a9dcb3e470029733"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.19/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "db4d6268dab65485ed352ad99b81c21b1e0061796f0acf00d4eb1215782fa21e"
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
