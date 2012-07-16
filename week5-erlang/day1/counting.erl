% Week 5 - Erlang
% Day 1
%
% Problem: Write a function that uses recursion to count to ten.
-module(counting).
-export([count/1]).

count(MaxValue) -> count_to(MaxValue, 1).

count_to(MaxValue, MaxValue) -> [MaxValue];
count_to(MaxValue, Current) -> [Current| count_to(MaxValue, Current + 1)].