class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.6.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.6.1/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "c19a6726665c197662b85aa0d541437ec01ea3b772d3e941dc652894a295ffbe"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.6.1/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "5009c0675adca9533d399a23fd529478420941e38306ecdc47fc960fc4ad21d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.6.1/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c8ee94016a30dda873597d76ffd74227514670cbd06ca12900615e3805733a8a"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.6.1/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9bbc6387cd31078a661362c9a9cf183f0e885c0bcb6073c803efa9fb7cf69647"
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
