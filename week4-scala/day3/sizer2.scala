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
	/*
		This method is the work horse for calculating the size and link count. It
		returns this information as a tuple of two elements where the first is
		the size and the second is the link count. I used a tuple to return two
		separate pieces of information from a single function call (we already have
		the page data so why not use it) and to avoid creating my own type.
	*/
	def getPageInfo(url: String): Tuple2[Int, Int] = {
		val page = Source.fromURL(url).mkString
		val linkPattern = "<a href".r  // a quick a dirty regex for finding links
		(page.length, linkPattern.findAllIn(page).size)
	}
}

// Just to note the timing differences on my machine, I added a few more sites.
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