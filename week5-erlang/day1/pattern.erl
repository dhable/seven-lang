% Week 5 - Erlang
% Day 1
%
% Problem: Write a function that uses matching to selectively print "success" or
%		   "error: message" given input of the form {error, Message} or success.
-module(pattern).
-export([write_message/1]).


write_message(success) -> "success";
write_message({error, Message}) -> string:concat("error: ", Message).