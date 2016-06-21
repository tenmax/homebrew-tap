class Azurekit < Formula
  desc "CLI toolkit to interact with microsoft azure blob storage."
  homepage "https://github.com/tenmax/azurekit"
  url "https://github.com/tenmax/azurekit/releases/download/v0.2.1/azurekit-0.2.1.zip"
  sha256 "a00f991f7e0a893c108c6003738af21a640d1f07a1ff7472c7597ab97f5a67f9"

  bottle :unneeded

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+"bin/azurecat"
    bin.install_symlink libexec+"bin/azuresas"
    bin.install_symlink libexec+"bin/azuresink"
    bin.install_symlink libexec+"bin/azuretbl2csv"
    bin.install_symlink libexec+"bin/azuretbl2json"
  end

  test do
    ENV.java_cache
    output = shell_output("#{bin}/azurecat -v")
    assert_match /azurecat version #{version}/, output
    output = shell_output("#{bin}/azuresas -v")
    assert_match /azuresas version #{version}/, output
    output = shell_output("#{bin}/azuresink -v")
    assert_match /azuresink version #{version}/, output
    output = shell_output("#{bin}/azuretbl2csv -v")
    assert_match /azuretbl2csv version #{version}/, output
    output = shell_output("#{bin}/azuretbl2json -v")
    assert_match /azuretbl2json version #{version}/, output
  end
end
