class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.17.29"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.29/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "f7e2b018bba84e4a613a8e6434b38ddc5c93279b862667f0c914f722b18b02bf"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.29/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "e7731b515eecbe9bcedac9ac13127aee248beb63fe0cb054c330daf201a97714"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.29/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "473d024691a35412d55dbbed7d11e1ac8527405d4aea9d21c90bcbe2e5e6a8cb"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.29/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f5b4d794c08d5f01bf8c7d892d17f463b51ef862a57c4f7a70bc6a1ad85327f6"
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
