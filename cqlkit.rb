class Cqlkit < Formula
  desc "cqlkit is a CLI tool to export Cassandra query to CSV and JSON format."
  homepage "https://github.com/tenmax/cqlkit"
  url "https://github.com/tenmax/cqlkit/releases/download/0.3.0/cqlkit.zip"
  sha256 "ce45a66ebfa821a63ad3155a12b83a631b345cf5d68e8bdf53fba24fe17fc01d"

  bottle :unneeded

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+"bin/cql2cql"
    bin.install_symlink libexec+"bin/cql2csv"
    bin.install_symlink libexec+"bin/cql2json"
  end

  test do
    ENV.java_cache
    output = shell_output("#{bin}/cql2cql -v")
    assert_match /cql2cql version #{version}/, output
    output = shell_output("#{bin}/cql2csv -v")
    assert_match /cql2csv version #{version}/, output
    output = shell_output("#{bin}/cql2json -v")
    assert_match /cql2json version #{version}/, output
  end
end
