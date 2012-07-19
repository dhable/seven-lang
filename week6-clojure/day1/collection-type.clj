; Week 6 - Clojure
; Day 1
;
; Problem: Write a function called (collection-type col) that returns :list, :map or :vector
; based on the type of collection col.
(defn collection-type [col] 
	(if (list? col) :list 
		(if (map? col) :map 
			(if (vector? col) :vector nil))))