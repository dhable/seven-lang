% Week 5 - Erlang
% Day 1
%
% Problem: Write a function that uses recursion to count to ten.
-module(counting).
-export([count/1]).

count(MaxValue) -> count_to(MaxValue, 1).

% Uses pattern matching to define the terminal case - when the current
% count is the same as MaxValue and then to return MaxValue a s list of
% one element.
count_to(MaxValue, MaxValue) -> [MaxValue];

% Here we pass along the max and the current values since we're somewhere
% in the sequence and create a list of the counting with a recursive call
% to continue counting until we hit the max value.
count_to(MaxValue, Current) -> [Current| count_to(MaxValue, Current + 1)].