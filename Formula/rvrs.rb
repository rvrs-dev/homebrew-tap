class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.14.10"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.14.10/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "9a967d1092f1f18582ff0246f8efb52de6d9eb5eb4eb02baf1013370e7f0d520"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.14.10/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "fc36794bea330ec3a9819cad6528f6c45e84778bd039966786fec367c3e213c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.14.10/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bc57fefa56e41a3397d3cabd41040645577ba06639d7906cb26781635589b46a"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.14.10/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d1305042c3867f24f3bc5b4ace01cd0c8cb91c78dbd88911b4aae947436698cb"
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
