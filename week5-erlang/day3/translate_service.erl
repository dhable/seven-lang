% Week 5 - Erlang
% Day 3
%
% Problem: Monitor the translate_service and restart it should it die.

-module(translate_service).
-export([loop/0, translate/1]).

loop() ->
	receive
		{From, "casa"} ->
			From ! "house",
			loop();

		{From, "blanca"} ->
			From ! "white",
			loop();

		{From, "die"} ->
			From ! "Ok, I'll die.",
			exit({translate_service, die, at, erlang:time()});

		{From, _} ->
			From ! "I don't understand",
			loop()
end.


translate(Word) ->
	translator ! {self(), Word},
	receive
		Translation -> Translation
	end.
