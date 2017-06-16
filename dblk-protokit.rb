class DblkProtokit < Formula
  desc "DoubleClick ADX bidrequest and bidrespone json2proto and proto2json utils."
  homepage "https://github.com/tenmax/dblk-protokit"
  url "https://github.com/tenmax/dblk-protokit/releases/download/v1.0.0/dblk-proto2json-1.0.0.zip"
  sha256 "aa2d902d0c6f7bdde18b2d096775579f38fc66fd6f1d70b88aeaa447b2e543b4"

  bottle :unneeded

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+"bin/proto2json"
    bin.install_symlink libexec+"bin/json2proto"
  end
end
