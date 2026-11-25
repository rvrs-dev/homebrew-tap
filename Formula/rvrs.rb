class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.17.17"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.17/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "659551f118492083c3f8e21c8a73cb8c6923a83484da41094b4fe5be5ab77128"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.17/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "020745daa02e4f66a4fd12e1d5b734e2258653196cf8b2d05eff41155cb88717"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.17/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d778b5fcacea57ee75133cae876fef5066104dae212eef194cf38e9bb5dbb2a0"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.17/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "274d92492647d5e198b3d003d54daa12b7a51e6c0976957e02b7a3e497a9252b"
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
