class TenmaxApacheSpark < Formula
  desc "Engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  url "https://www.apache.org/dyn/closer.lua?path=spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz"
  mirror "https://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz"
  version "2.4.5"
  sha256 "020be52524e4df366eb974d41a6e18fcb6efcaba9a51632169e917c74267dd81"
  head "https://github.com/apache/spark.git"

  bottle :unneeded

  resource "hadoop-azure" do
    url "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.3/hadoop-azure-2.7.3.jar"
    sha256 "41ac695ff79e86d89543c85c75125431e4a473c4b564cb3cb05993647ffaa016"
  end

  resource "azure-storage" do
    url "https://repo1.maven.org/maven2/com/microsoft/azure/azure-storage/2.0.0/azure-storage-2.0.0.jar"
    sha256 "847e8fc49faabfaf6344c002d9c22be0ee72ee21809fa5aec2fc8fcfe332b607"
  end

  resource "core-site-template" do
    url "https://gist.githubusercontent.com/phstudy/2337c262633dc994347dfbb14503609a/raw/f1aa6809f720c1d82457b2820a313c10aca9c2e7/core-site.xml.template"
    sha256 "adea425f56b932a3a84f6246a50ebd6205907203b7a458ea95a1aed6037ad915"
  end

  def install
    # Rename beeline to distinguish it from hive's beeline
    mv "bin/beeline", "bin/spark-beeline"

    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

    (libexec/"jars").install resource("hadoop-azure")
    (libexec/"jars").install resource("azure-storage")
    (libexec/"conf").install resource("core-site-template")
    mv libexec/"conf/core-site.xml.template", libexec/"conf/core-site.xml"
    rm_f libexec/"jars/xercesImpl-2.9.1.jar"
  end

  test do
    assert_match "Long = 1000",
      pipe_output(bin/"spark-shell --conf spark.driver.bindAddress=127.0.0.1",
                  "sc.parallelize(1 to 1000).count()")
  end
end
