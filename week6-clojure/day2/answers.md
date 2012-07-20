Week 6 - Clojure
================

Day 2
-----

__Find the implementation of some of the commonly used macros in the Clojure language.__

This page, http://clojure.org/macros, discusses macros in clojure and also lists all of the places in the standard library that were generated using macros. For each macro listed, you can click on the name and then click the Source link to jump to the github code view for that macro. For example, here's the definition of the dosync macro - https://github.com/clojure/clojure/blob/d0c380d9809fd242bec688c7134e900f0bbedcac/src/clj/clojure/core.clj#L4469.


__Find an example of defining your own lazy sequence.__

This page, http://clojure.org/lazy, talks about the lazy sequencing with clojure. About half way down the page, it shows some code using the lazy-seq and when-let constructs. It's these that make a sequence lazy.


__Find the current status of the defrecord and protocol features (these features were
still under development as this book was being developed).__

Since I'm reading this book a few years later and based on http://clojure.org/datatypes, these features are done and in the core language.