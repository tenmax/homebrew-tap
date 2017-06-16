class DblkProtoKit < Formula
  desc "DoubleClick ADX bidrequest and bidrespone json2proto and proto2json utils."
  homepage "https://github.com/tenmax/dblk-protokit"
  url "https://github.com/tenmax/dblk-protokit/releases/download/v1.0.0/dblk-proto2json-1.0.0.zip"
  sha256 "180a71bbdaedd4220ad9b889b2e829511cae3b447163039d66f466dd73bd2c5d"

  bottle :unneeded

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+"bin/proto2json"
    bin.install_symlink libexec+"bin/json2proto"
  end
end
