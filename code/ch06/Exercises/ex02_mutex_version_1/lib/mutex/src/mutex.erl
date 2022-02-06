-module(mutex).

-export([start/0, stop/0]).
-export([wait/0, signal/0]).
-export([init/0]).

start() ->
	register(mutex, spawn_link(?MODULE, init, [])).

stop() ->
	mutex ! stop.

wait() ->
	mutex ! {wait, self()},
	receive ok -> ok end.

signal() ->
	mutex ! {signal, self()}, ok.

init() -> 
	process_flag(trap_exit, true),
	free().

free() ->
	receive
		{wait, Pid} ->
			Pid ! ok,
			busy(Pid);
		stop ->
			terminate();
		{'EXIT', _Pid, Reason} -> 
			io:format("EXIT. Reason = ~p~n", [Reason]),
			{error, Reason}	
	end.
	
busy(Pid) ->
	receive
		{signal, Pid} ->
			free()
	end.
	
terminate() ->
	receive
		{wait, Pid} ->
			exit(Pid, kill),
			terminate()
	after
		0 -> ok
	end.