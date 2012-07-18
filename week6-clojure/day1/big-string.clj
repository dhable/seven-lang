; Week 6 - Clojure
; Day 1
;
; Problem: Implement a function called (big st n) that returns true if a string st
; is longer than n characters.
(defn big [st n] (> (count st) n))