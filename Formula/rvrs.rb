class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.17.15"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.15/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "7fec3489d4ae130fa238c3d7103af53cded5337f65de6ad56d6f3a6fd75204d2"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.15/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "c73941cb84b9746ed5e80cece82d05a975c3bd3b4f3b5eac6ba7a24133ae00ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.15/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fb127f125b67e49be798582750203991d8873e7a73f4bdc0299d66e1956e8ed1"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.17.15/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e17aebeccf4882e0ec034120ddf2a1376631c93f4b63cf1bbdc080f63b076166"
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
