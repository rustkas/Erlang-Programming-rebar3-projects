-module(server).

-export([start/2, stop/1, call/2]).


start(Name, Data) when is_atom(Name) ->
	Pid = spawn(generic_handler, init, [Data]),
	register(Name, Pid), ok.

stop(Name) when is_atom(Name) ->
	Name ! {stop, self()},
	receive {reply, Reply} -> Reply end.

call(Name, Msg) when is_atom(Name) ->
	Name ! {request, self(), Msg},
	receive {reply, Reply} -> Reply end.



