class TenmaxApacheSpark < Formula
  desc "Engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  url "http://archive.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz"
  version "2.1.0"
  sha256 "0834c775f38473f67cb122e0ec21074f800ced50c1ff1b9e37e222a0069dc5c7"
  head "https://github.com/apache/spark.git"

  bottle :unneeded

  resource "hadoop-azure" do
    url "http://central.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.3/hadoop-azure-2.7.3.jar"
    sha256 "41ac695ff79e86d89543c85c75125431e4a473c4b564cb3cb05993647ffaa016"
  end

  resource "azure-storage" do
    url "http://central.maven.org/maven2/com/microsoft/azure/azure-storage/2.0.0/azure-storage-2.0.0.jar"
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
    bin.write_exec_script Dir["#{libexec}/bin/*"]

    (libexec/"jars").install resource("hadoop-azure")
    (libexec/"jars").install resource("azure-storage")
    (libexec/"conf").install resource("core-site-template")
    mv libexec/"conf/core-site.xml.template", libexec/"conf/core-site.xml"
    rm_f libexec/"jars/xercesImpl-2.9.1.jar"
  end

  test do
    system "#{bin}/spark-shell <<<'sql(\"select 1\").show()'"
  end
end
