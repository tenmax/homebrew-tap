class Cqlkit < Formula
  desc "CLI tool to export Cassandra query as CSV and JSON format"
  homepage "https://github.com/tenmax/cqlkit"
  url "https://github.com/tenmax/cqlkit/releases/download/v0.3.1/cqlkit-0.3.1.zip"
  sha256 "f1d0cdbfa0780ee66c3b6e42d9eef1dd6b9c925918090ea2d4a547cb80dca4e8"

  bottle :unneeded

  depends_on :java => "1.8"

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+"bin/cql2cql"
    bin.install_symlink libexec+"bin/cql2csv"
    bin.install_symlink libexec+"bin/cql2json"
  end

  test do
    output = shell_output("#{bin}/cql2cql -v")
    assert_match /cql2cql version #{version}/, output
    output = shell_output("#{bin}/cql2csv -v")
    assert_match /cql2csv version #{version}/, output
    output = shell_output("#{bin}/cql2json -v")
    assert_match /cql2json version #{version}/, output
  end
end
