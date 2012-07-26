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
	// The reference is immutable but because I'be built a new HashMap, the object
	// is mutable. This might give the impression that your data can't change and
	// then you might be surprised when it does.
	val curseWordMapping = new HashMap[String, String]

	Source.fromFile("censorlist.txt").getLines().foreach { line =>
		val entry = line.split("->")
		curseWordMapping += entry(0) -> entry(1)
	}
}

// I wanted to create a string with the Censor trait since it felt like a natural
// extension of the string. This isn't possible though since the java.lang.String
// object is final and using the with <trait name> construct creates a subclass.
// Since the object isn't important in the example, I just mixed the trait into
// Object.
val fcc = new Object with Censor
val cleanPhrase = fcc.censor("shoot this darn map won't fold".split("\\s")).foldLeft("") {(str, word) => str + word + " " }
println(cleanPhrase)