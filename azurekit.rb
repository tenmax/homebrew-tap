class Azurekit < Formula
  desc "CLI toolkit to interact with microsoft azure blob storage."
  homepage "https://github.com/tenmax/azurekit"
  url "https://github.com/tenmax/azurekit/releases/download/v0.2.0/azurekit-0.2.0.zip"
  sha256 "f4c1fe80fb203df4f53d56ad6876ceee55fc15c2ce64c447db3f84a5fb8e047e"

  bottle :unneeded

  def install
    libexec.install %w[bin lib]
    bin.install_symlink libexec+"bin/azurecat"
    bin.install_symlink libexec+"bin/azuresas"
    bin.install_symlink libexec+"bin/azuresink"
  end

  test do
    ENV.java_cache
    output = shell_output("#{bin}/azurecat -v")
    assert_match /azurecat version #{version}/, output
    output = shell_output("#{bin}/azuresas -v")
    assert_match /azuresas version #{version}/, output
    output = shell_output("#{bin}/azuresink -v")
    assert_match /azuresink version #{version}/, output
  end
end
