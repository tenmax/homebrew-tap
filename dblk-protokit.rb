class DblkProtokit < Formula
  desc "DoubleClick ADX bidrequest and bidrespone json2proto and proto2json utils."
  homepage "https://github.com/tenmax/dblk-protokit"
  url "https://github.com/tenmax/dblk-protokit/releases/download/v1.0.1/dblk-proto2json-1.0.1.zip"
  sha256 "a0d1d1e37f5a57723a51b87acb8dd7259cc48abee60ba005c3ae546c0cba45e6"
  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+"bin/proto2json"
    bin.install_symlink libexec+"bin/json2proto"
  end
end
