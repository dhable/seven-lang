Week 6 - Clojure
================

Day 1
-----

__Find examples using Clojure sequences.__

http://en.wikibooks.org/wiki/Clojure_Programming/Examples/API_Examples/Sequences


__Find the formal definition of a Clojure function.__

A function in clojure is nothing more than an anonymous function block bound to a named variable. The defn construct is a macro used to make declaring a function easier.

http://clojure.org/functional_programming


__Find a script for quickly invoking the repl in your environment.__

Like the author, I've been using leiningen for a few months now. I find it easier than my previous method, which was to use the java -jar clojure.jar and hope my classpath was ok. I don't think anyone should use anything other than leiningen, given how powerful it is.