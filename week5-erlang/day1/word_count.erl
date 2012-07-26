% Week 5 - Erlang
% Day 1
%
% Problem: Write a function that uses recursion to return the number of
%		   words in a string.
-module(word_count).
-export([count/1]).

count([]) -> 0; % empty lists have 0 words
count([_]) -> 1; % a list with a single character is 1
count([FirstChar|Str]) -> if
	FirstChar == 32 -> % increment the count if there is a space character
		1 + count(Str);
	true -> % otherwise return the count from the subset of the string
		count(Str)
end.
