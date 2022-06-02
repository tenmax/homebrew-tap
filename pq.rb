class Pq < Formula
  desc "A tool to transform unstructured text to csv by regular expression."
  homepage "https://github.com/tenmax/pq"
  url "https://github.com/tenmax/pq/releases/download/v1.0.0/pq-1.0.0.zip"
  sha256 "c969106520d34073498f172325e3ef573756375afdb844fc9d5fd81d0fb968b7"

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+"bin/pq"
  end
end
