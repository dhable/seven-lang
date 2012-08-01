; Week 6 - Clojure
; Day 3
;
; Use refs to create a vector of accounts in memory. Create debit and credit 
; functions to change the balance of an account.
(defn create-accounts
	[& balances]
	(let [create-map-fn (fn [bal] {:balance bal})
		  account-vector (vec (map create-map-fn balances))]
		(ref account-vector)))

(defn update-account
	[accounts-ref acct-index delta]
	(let [old_balance (:balance (nth @accounts-ref acct-index))
		  new_balance {:balance (+ old_balance delta)}]
		(dosync (alter accounts-ref assoc acct-index new_balance))))

(defn debit
	[accounts-ref acct-index amt]
	(let [debit-amt (- amt)]
		(update-account accounts-ref acct-index debit-amt)))

(defn credit
	[accounts-ref acct-index amt]
	(let [credit-amt amt]
		(update-account accounts-ref acct-index credit-amt)))


; Usage of the account code
(def accounts (create-accounts 10 0 -5 1000))

(debit accounts 3 100)
(credit accounts 2 100)