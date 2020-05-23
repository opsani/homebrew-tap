# This file was generated by GoReleaser. DO NOT EDIT.
class OpsaniCli < Formula
  desc "Opsani CLI"
  homepage "https://github.com/opsani/cli"
  version "0.1.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/opsani/cli/releases/download/v0.1.0/opsani-cli_0.1.0_macOS_amd64.tar.gz"
    sha256 "d5945ef437fd166a50b8901a6893fe46f121cb0973720d784824621cb2fa1ab5"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/opsani/cli/releases/download/v0.1.0/opsani-cli_0.1.0_linux_amd64.tar.gz"
      sha256 "71fbd374324249a52707588d49734644d77654682f47ef7a389695c8cef71984"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/opsani/cli/releases/download/v0.1.0/opsani-cli_0.1.0_linux_arm64.tar.gz"
        sha256 "683b17fec23bf622940a377d9a5ba30df7e356a81e1ca84cf7d0a1b6a1d00803"
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
