class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.17.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.6/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "f5b5110a3892f20f1016f9db9138299071cbc16846ca87cc12bec346e0a19caa"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.6/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "c1e3b6b2186d20e13a5b8f301de28e001534124d02bfa11b8883bb969017f375"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.6/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5093610ff340e6c6408e4c25afb3e37977152c41c8597422ff2333d418e2ac75"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.6/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "77164cd1ef3a2a40203548947061758f04b18d80587dd0c02f2734b889f6107d"
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
