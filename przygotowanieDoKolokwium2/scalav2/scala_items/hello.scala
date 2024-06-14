object Hello {
  def main(args: Array[String]): Unit = {
    val scalaVersion = sys.env.get("SCALA_VERSION").getOrElse("Unknown")
    println(s"Hello, World! Scala version: $scalaVersion")
  }
}