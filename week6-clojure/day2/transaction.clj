; Week 6 - Clojure
; Day 2
;
; Problem: Write a type using defrecord that implements a protocol.

; I couldn't think of anything to model so I picked a transaction, like a
; database transaction. It doesn't really do anything other than change the
; state of the transaction.
(defprotocol Transaction
	(commit [c])
	(rollback [c]))


(defrecord MessageQueueTransaction [state]
	Transaction
	(commit [_] (MessageQueueTransaction. :committed))
	(rollback [_] (MessageQueueTransaction. :rolledback))

	Object
	(toString [this] (str "[" state "]")))