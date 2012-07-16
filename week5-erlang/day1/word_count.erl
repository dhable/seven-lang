% Week 5 - Erlang
% Day 1
%
% Problem: Write a function that uses recursion to return the number of
%		   words in a string.
-module(word_count).
-export([count/1]).

count([]) -> 0;
count([_]) -> 1;
count([FirstChar|Str]) -> if
	FirstChar == 32 ->
		1 + count(Str);
	true ->
		count(Str)
end.
