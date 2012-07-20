; Week 6 - Clojure
; Day 2
;
; Problem: Write a type using defrecord that implements a protocol.
(defprotocol Transaction
	(commit [c])
	(rollback [c]))


(defrecord MessageQueueTransaction [state]
	Transaction
	(commit [_] (MessageQueueTransaction. :committed))
	(rollback [_] (MessageQueueTransaction. :rolledback))

	Object
	(toString [this] (str "[" state "]")))