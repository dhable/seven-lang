Week 2 - Io
===========

Day 1
-----

__Q: Evaluate 1 + 1 and then 1 + "one". Is Io a strongly typed or weakly typed?__

```io
Io> 1 + 1
==> 2
Io> 1 + "one"

  Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
  ---------
  message '+' in 'Command Line' on line 1

Io> 
```

Given this output, it looks like Io is a strongly typed language since it is complaining about the mismatch in types. In this case it wouldn't let the string stand in for the Number or attempt a conversion. Let's try with a string that has a more obivious conversion to a number.

```io
Io> 1 + "1"

  Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
  ---------
  message '+' in 'Command Line' on line 1
```

Again, this looks like a strongly typed language. You might be fooled into thinking that Io is weakly typed since 2.5 + 1 does come out to a floating point, but it's only because Io treats both as Number.

```io
Io> 2.5 + 1
==> 3.5
Io> 2.5 type
==> Number
Io> 1 type
==> Number
```


__Q: Is 0 true or false? What about the empty string? Is nil true or false? Support your answer with code.__

The values of 0 and the empty string evaluate to true. The value of nil evaluates to false.

```io
Io> 0 and true
==> true
Io> "" and true
==> true
Io> nil and true
==> false
```

__Q: How can you tell what slots a prototype supports?__

Send the prototype the message "slotNames".

__Q: What is the difference between = (equals), := (colon equals), and ::= (colon colon equals)? When would you use each one?__

- The = operator assigns a new value to an existing slot, raising an exception if the slot doesn't exist.
- The := operator assigns a value to a slot and creates a new slow if that slot doesn't exist.
- The ::= operator assigns a value to a slot, creating the slot if it doesn't exist and also creates a setter. The setter is a method that follows the JavaBean naming standard that simply updates the slot value and returns the prototype instance as a result.
