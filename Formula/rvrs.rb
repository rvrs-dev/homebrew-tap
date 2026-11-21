class Rvrs < Formula
  desc "traceroute, ping, MTR, dig and BGP in one binary"
  homepage "https://rvrs.dev"
  version "0.12.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.12.4/rvrs-aarch64-apple-darwin.tar.gz"
      sha256 "51341661b06bf20269e292d85bace33ad2e330d5bd9a56df181a9f1235f7381d"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.12.4/rvrs-x86_64-apple-darwin.tar.gz"
      sha256 "218327d4e303e6ab70e2b7487decf7da54657de2cb93e35362d42fb87123fddc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.12.4/rvrs-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7450b0715620e94b9a3e2a49c359badc6edd1306566dd933ee03cf5b74868fa9"
    end
    on_intel do
      url "https://github.com/rvrs-dev/cli/releases/download/v0.12.4/rvrs-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4b5fbbd0654508cf0b235dacb09988aca64c05d7f8b88e92566f371502f5fa6d"
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
