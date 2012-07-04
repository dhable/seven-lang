Week 3 - Prolog
===============

Day 2 Answers
-------------

_Q: Fine some implementations of a Fibonacci series and factorials. How do they work?_

This site, http://cubbi.com/fibonacci/prolog.html, contains a number of different algorithms
for calculating a Fibonacci series. The basic rule takes the Nth parameter and the series
answer as a parameter. The rule take the sum of the (N-1) and (N-2) answers, providing a base
case for the N=1 and N=0 case, which evaluate to true and halt the unwinding of N.

The factorial example can be found at http://stackoverflow.com/questions/9576494/prolog-factorial-recursion.
It works in a similar fashon of using the rule to unwind the N value down to the base case of
N=0 and then evaluating the multiplication when the recursion is unwound.


_Q: A real-world community using Prolog. What problems are they solving with it today?_

This answer, http://stackoverflow.com/questions/130097/real-world-prolog-usage, at StackOverflow
has a couple of answers that are interesting on how people are using Prolog. It seems that Prolog
is being used for generating documents or code.

I should not that in the interviews with Joe Armstrong and Simon Peyton Jones for the book Coders At
Work by Peter Seibel revealed that both the initial Erlang and Haskel compilers were written using
Prolog.