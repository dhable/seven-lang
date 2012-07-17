% Week 5 - Erlang
% Day 2
%
% Problem: Consider a shopping list that looks like [{item quantity price},...]. Write a
% list comprehension that builds a list of items of the form [{item total_price},...],
% where total_price is quantity times price.
-module(shopping).
-export([total_items/1]).

total_items(ShoppingCart) ->
	[{Item, Quantity * Price} || {Item, Quantity, Price} <- ShoppingCart].