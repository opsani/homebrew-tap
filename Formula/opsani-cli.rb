# This file was generated by GoReleaser. DO NOT EDIT.
class OpsaniCli < Formula
  desc "Opsani CLI"
  homepage "https://github.com/opsani/cli"
  version "0.2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/opsani/cli/releases/download/v0.2.0/opsani-cli_0.2.0_macOS_amd64.tar.gz"
    sha256 "31fbf209a03babba35a5faab472dd38c497ee61ea04dfe5ee32aeaed5ff9ec2c"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/opsani/cli/releases/download/v0.2.0/opsani-cli_0.2.0_linux_amd64.tar.gz"
      sha256 "df75efa5436b1d267928007c6ca173df62c1f7acf4978491976b1a621961223f"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/opsani/cli/releases/download/v0.2.0/opsani-cli_0.2.0_linux_arm64.tar.gz"
        sha256 "3bd10c1b30462f655ab8b283b119c8b60360c6905cb0d9ad6c4d356809f9b23b"
      else
      end
    end
  end
  
  head do
    url "https://github.com/opsani/cli.git"
    depends_on "go"
  end

  def install
    system "make build" if build.head?
    bin.install "bin/opsani"
    (bash_completion/"opsani.sh").write `#{bin}/opsani completion -s bash`
    (zsh_completion/"_opsani").write `#{bin}/opsani completion -s zsh`
    (fish_completion/"opsani.fish").write `#{bin}/opsani completion -s fish`
  end

  test do
    help_text = shell_output("#{bin}/opsani --help")
    assert_includes help_text, "Usage:"
  end
end
