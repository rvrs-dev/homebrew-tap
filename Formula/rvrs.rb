class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.15.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.15.3/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "a0b28bdcadd343fa020794754cdd3c7dfba34064ec913a45e97fcaa6042be048"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.15.3/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "128dce438ee89273fc8aa631b1d9eee29e7228322d700157a0298f1c62b55ae5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.15.3/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bb961cb708c43deadd9fde21304bd64b54b7f1fe687adc8cf28659741a557b21"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.15.3/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "587822690a75019fcdf02045c374664c8275bcefdb7481bf2a17f6e77ff68ca1"
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
