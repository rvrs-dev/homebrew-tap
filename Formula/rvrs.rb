class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.10.0/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "fb2bd6ec6b70c64f73770d57fa132585e6b8309a35f7304afd77dcfc4eebeae9"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.10.0/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "4cc532bdab12522ccfa18806c832fff00bda35548ea68ee1a2df5416d1fb0a15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.10.0/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0f17565e9b12c49744ca713930857ae08cd586bda1e352988859a248b65e477f"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.10.0/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "433c35c4e9691221cadf4310d95c7492488591ad65a4ea8775cd74f3b5ab83be"
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
