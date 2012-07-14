/*
	Week 4 - Scala
	Day 2

	Problem: Write a Censor trait with a method that will replace the curse words Shoot
	and Darn with Pucky and Beans alternatives. Use a map to store the curse words and
	their alternatives.
*/
trait Censor {
	def censor(wordList: Seq[String]) = wordList.map { word =>
			if(Censor.curseWordMapping.isDefinedAt(word))
				Censor.curseWordMapping(word)
			else
				word
		}
}

object Censor {
	val curseWordMapping = Map(
		"shoot" 	-> "pucky",
		"darn"		-> "beans"
	)
}

val fcc = new Object with Censor
val cleanPhrase = fcc.censor("shoot this darn map won't fold".split("\\s")).foldLeft("") {(str, word) => str + word + " " }
println(cleanPhrase)