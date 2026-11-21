class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.12.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.12.2/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "be12703a847e8884d79dea1f27954c02488242219704ca27b88d2f8d2bb3c8fe"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.12.2/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "5bcc34c9a18722d88ec4af988c0dddf89d55caa8c233651a57008435c3b1c2cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.12.2/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3f2950b5216de55671d1db34e299551b0d8e21058b9b444e44dcaeb750845aae"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.12.2/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "59f6a05b9ae50d280fc7d55471eb0a71df46df7c7ec65759d0094c657e3fefe5"
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
