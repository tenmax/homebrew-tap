class Cqlkit < Formula
  desc "cqlkit is a CLI tool to export Cassandra query as CSV and JSON format."
  homepage "https://github.com/tenmax/cqlkit"
  url "https://github.com/tenmax/cqlkit/releases/download/v0.3.1/cqlkit-v0.3.1.zip"
  sha256 "9976ddbe584af0e678f22235a5d2b09e5de23d51630b8a4976197a70ccbe8d09"

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
