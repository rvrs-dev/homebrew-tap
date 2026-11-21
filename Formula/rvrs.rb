class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.8.0/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "2649d6731e2511904e3e44dfdb60a3f00e05b3f5b417fc0124e66f113abae469"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.8.0/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "2ca33345ae70c2d53a6d7cb027479d412fdaa6017c431174ddc56837c2bcd4b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.8.0/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cc47c392da28307f4120c8198d75d1910846399f8f1a6839cb02a37205b29317"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.8.0/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "31220ee80f1548c46b353804f2efac96364db41553c81c1ac1c504b927581093"
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
