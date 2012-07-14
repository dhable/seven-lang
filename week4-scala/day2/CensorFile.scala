/*
	Week 4 - Scala
	Day 2

	Problem: Load the curse words and alternatives from a file.
*/
import collection.mutable.HashMap
import scala.io.Source

trait Censor {
	def censor(wordList: Seq[String]) = wordList.map { word =>
			if(Censor.curseWordMapping.isDefinedAt(word))
				Censor.curseWordMapping(word)
			else
				word
		}
}

object Censor {
	val curseWordMapping = new HashMap[String, String]

	Source.fromFile("censorlist.txt").getLines().foreach { line =>
		val entry = line.split("->")
		curseWordMapping += entry(0) -> entry(1)
	}
}

val fcc = new Object with Censor
val cleanPhrase = fcc.censor("shoot this darn map won't fold".split("\\s")).foldLeft("") {(str, word) => str + word + " " }
println(cleanPhrase)