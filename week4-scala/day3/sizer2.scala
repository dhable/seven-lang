/*
	Week 4 - Scala
	Day 3

	Problem: Take the sizer application and add a message to count the number of
	links on the page.
*/
import scala.io._
import scala.actors._
import Actor._

object PageLoader {
	def getPageInfo(url: String): Tuple2[Int, Int] = {
		val page = Source.fromURL(url).mkString
		val linkPattern = "<a href".r
		(page.length, linkPattern.findAllIn(page).size)
	}
}

val urls = List("http://www.google.com",
				"http://www.twitter.com",
				"http://www.amazon.com",
				"http://www.cnn.com",
				"http://www.stackoverflow.com",
				"http://www.github.com",
				"http://www.techcrunch.com",
				"http://www.yahoo.com",
				"http://www.facebook.com",
				"http://www.apple.com",
				"http://www.microsoft.com")


def timeMethod(method: () => Unit) = {
	val start = System.nanoTime
	method()
	val end = System.nanoTime
	println("Method took " + (end - start)/1000000000.0 + " seconds")
}

def getPageInfoSequential() = {
	for(url <- urls) {
		val info = PageLoader.getPageInfo(url)
		println("URL = " + url + " => size = " + info._1 + ", num links = " + info._2)
	}
}

def getPageInfoParallel() = {
	val caller = self

	for(url <- urls) {
		actor { caller ! (url, PageLoader.getPageInfo(url)) }
	}

	for(i <- 1 to urls.size) {
		receive {
			case (url, info: Tuple2[Int, Int]) =>
				println("URL = " + url + " => size = " + info._1 + ", num links = " + info._2)
		}
	}
}

println("Sequential run:")
timeMethod { getPageInfoSequential }

println("Parallel run:")
timeMethod { getPageInfoParallel }