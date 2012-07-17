% Week 5 - Erlang
% Day 2
%
% Problem: Consider a list of keyword-value tuples, such as [{erlang, "a functional language"},
% {ruby, "an OO language"}]. Write a function that accepts the list and a keyword and returns
% the associated value for the keyword.
-module(keyword).
-export([fetch/2]).


fetch(Keyword, List) -> 
	[{_, Description} | []] = lists:filter(fun(X) -> {K, _} = X, K == Keyword end, List), Description.