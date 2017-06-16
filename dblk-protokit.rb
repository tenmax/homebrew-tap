class DblkProtokit < Formula
  desc "DoubleClick ADX bidrequest and bidrespone json2proto and proto2json utils."
  homepage "https://github.com/tenmax/dblk-protokit"
  url "https://github.com/tenmax/dblk-protokit/releases/download/v1.0.0/dblk-proto2json-1.0.0.zip"
  sha256 "85cfc7f5b98e756a8aba045a68e968a13955e4f65b684d85b2f544d2a0c90040"

  bottle :unneeded

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+"bin/proto2json"
    bin.install_symlink libexec+"bin/json2proto"
  end
end
