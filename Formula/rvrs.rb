class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.16.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.16.2/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "55b21189e6c876fda7f588397b5718b3d756c56771d2ef66a9bff53a7200c949"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.16.2/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "2a5af1a984316a2aaff62874a13d93ac308a57a6122cf45c52325c3b68f0768a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.16.2/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8695e854f67f1e646d73de81d0e04ea3d9a50408f20cbc2f8d7406b9ea51978d"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.16.2/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "440929b675fc5f5515eae9e682268ccc2828b51e151729b0a55971ca5801fae9"
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
