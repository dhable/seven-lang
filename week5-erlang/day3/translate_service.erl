% Week 5 - Erlang
% Day 3
%
% Problem: Monitor the translate_service and restart it should it die.

-module(translate_service).
-export([loop/0, translate/1]).

% This is the background process that is going to be created by the monitor.
loop() ->
	receive
		{From, "casa"} ->
			From ! "house",
			loop();

		{From, "blanca"} ->
			From ! "white",
			loop();

		{From, "die"} -> % needed to add a die to test the monitor.
			From ! "Ok, I'll die.",
			exit({translate_service, die, at, erlang:time()});

		{From, _} ->
			From ! "I don't understand",
			loop()
end.

% A wrapper function to call the background process and then wait for a response.
% Since this is using a registered atom, we need to use the monitor to create the
% process before calling translate.
translate(Word) ->
	translator ! {self(), Word},
	receive
		Translation -> Translation
	end.
