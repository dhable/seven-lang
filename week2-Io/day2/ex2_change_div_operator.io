// Week 2 - Io
// Day 2
// 
// Problem: How would you change / to return 0 if the denominator is zero?

OperatorTable addOperator("div", 2)
Number div := Number getSlot("/")
Number / = method(denom, if(denom == 0) then(return 0) else(return call target div denom))