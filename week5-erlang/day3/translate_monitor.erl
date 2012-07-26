% Week 5 - Erlang
% Day 3
%
% Problem: Monitor the translate_service and restart it should it die.
-module(translate_monitor).
-export([loop/0]).

% This is the translate service monitor process. Once created with spawn_process,
% it can accept messages to create a translate service and then traps the service
% exit messages to restart a new process when the service dies.
loop() ->
	process_flag(trap_exit, true),
	receive
		new ->
			io:format("creating new translate service~n"),
			register(translator, spawn_link(fun translate_service:loop/0)),
			loop();

		{'EXIT', _, _} ->
			self() ! new,
			loop()
end.
