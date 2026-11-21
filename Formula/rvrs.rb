class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.11.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.11.0/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "406bfaab2e834873d53b31b968d75b662acd6f6f958e01a9954023e192811ffe"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.11.0/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "ef763c8d0d13c824a44472379829226520f2634fd5af4e6df6fc4ee9d08c0c75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.11.0/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "476bb9cb7a71b7217bee4b704685b3118f0083b83c3c6f48f2a9e81f7377d855"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.11.0/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "27d02a449e7d82db5023b6c6bacf44482039fcf3fc5cf1a05426f4c86e6ca7bc"
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
