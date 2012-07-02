// Week 2 - Io
// Day 3
//
// Enhance the XML program to handle attributes: if the first argument is
// a map (use the curly brackets syntax), add attributes to the XML
// program. For example:
//
// book({"author": "Tate"}...) would print <book author="Tate">...

OperatorTable addAssignOperator(":", "atPutAttribute")

Map atPutAttribute := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
		call evalArgAt(1)
	)
)

curlyBrackets := method(
	r := Map clone
	call message arguments foreach(arg,
		r doMessage(arg)
	)
	r
)

Map printAttributeList := method(
	self foreach(key, value,
		write(" ", key, "=\"", value, "\"")
	)
)

Builder := Object clone

Builder forward := method(
	write("<", call message name)
	call message arguments foreach(argIndex, arg,
		skip := false
		if(argIndex == 0,
			if(arg name == "curlyBrackets",
				(self doMessage(arg)) printAttributeList
				skip := true
			)
			writeln(">")
		)

		if(skip == false,
			content := self doMessage(arg)
			if(content type == "Sequence", writeln(content))
		)
	)

	writeln("</", call message name, ">") 
)


// NOTE ON TESTING THIS CODE:
//	Uncommenting the following line in this file and running it along with the code
//	declaration above won't work. Thanks to a helpful blog entry from another reader,
// 	http://brikis98.blogspot.com/2012/02/seven-languages-in-seven-weeks-io-day-3.html,
//	it looks like the problem relates to Io's handling of the OperatorTable.
//
// To run, start Io interactivly and then load this file with the doFile("ex3_xml_attribute.io")
// command. From here, you can manually type the book construct below and see that it works.
//
// Builder book( { "author" : "Tate" }, "Seven Languages in Seven Weeks")
