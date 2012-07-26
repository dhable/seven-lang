% Week 5 - Erlang
% Day 2
%
% Problem: Consider a list of keyword-value tuples, such as [{erlang, "a functional language"},
% {ruby, "an OO language"}]. Write a function that accepts the list and a keyword and returns
% the associated value for the keyword.
-module(keyword).
-export([fetch/2]).

% Love the power here. This needs to be broken down a bit:
%
% fun(X) -> {K, _} = X, K == Keyword end
%	This defines a function that takes a tuple (key/value mapping in erlang maps), extracts
%	the key (K) while ignoring the value and then returns the boolean of whether the key (K)
%	matches the Keyword we're looking for.
%
% lists:filter(fun(X) -> {K, _} = X, K == Keyword end, List)
%	Uses the function from above to filter the list down to a list of elements that match the
%	Keyword we're looking for.
%
% [{_, Description} | []] = lists:filter(...)
%	Uses pattern matching to extract the description for the tuple that match this keyword. The
%	pattern is enforing a single return value, hence the [] in the tail section of the pattern.
%	At this point Description is bound to the value we want.
%
% The function then simply evaluates to Description, returning the value.
fetch(Keyword, List) -> 
	[{_, Description} | []] = lists:filter(fun(X) -> {K, _} = X, K == Keyword end, List), Description.