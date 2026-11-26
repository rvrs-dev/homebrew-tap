class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.17.24"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.24/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "1ad393ce969f6b02c44f520dfc70caf9c12c9fbb78a86f79f183a0fc7e3ecd7e"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.24/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "a34be9b0c865a515b9d2832ce87be63115e83f05c0479847e494ab6b6bf942c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.24/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b26af299f870381f0d4aaf1f43f9997e97e6c414ea8e8d37d821afa9c76be534"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.24/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "eff6fc9f358d3973542b462caca5f80a884768e0262c61aa3c12a4c94777468d"
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
