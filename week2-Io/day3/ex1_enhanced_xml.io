// Week 2 - Io
// Day 3
//
// Enhance the XML program to add spaces to show the indentation
// structure.

Builder := Object clone

Builder indent_level := -1

Builder indent := method(
	call target indent_level = call target indent_level + 1)

Builder unindent := method(
	call target indent_level = call target indent_level - 1)

Builder indentPadding := method(
	" " repeated(call target indent_level * 4))

Builder forward := method(
	call target indent
	writeln(call target indentPadding, "<", call message name, ">")

	call message arguments foreach(arg,
		content := self doMessage(arg)
		if(content type == "Sequence",
			call target indent
			writeln(call target indentPadding, content)
			call target unindent
		)
	)

	writeln(call target indentPadding, "</", call message name, ">")
	call target unindent
)

Builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript")
)