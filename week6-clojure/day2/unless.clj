; Week 6 - Clojure
; Day 2
;
; Problem: Implement an unless with an else condition using macros.
(defmacro unless [test if-stmt]
	(list 'if (list 'not test) if-stmt))
	
(defmacro unless-else [test if-stmt else-stmt]
	(list 'if (list 'not test) if-stmt else-stmt))