-module(fsm).

-export([start/0]).
-export([idle/0]).

start() ->
	Pid = spawn(fsm, idle, []),
	register(?MODULE, Pid), ok.

idle() ->
	receive
		{Number, incoming} ->
			start_ringing(),
			ringing(Number);
		off_hook ->
			start_tone(),
			dial()
	end.		
			
ringing(Number) ->
	receive
		{Number, other_on_hook} ->
			stop_ringing(),
			idle();
		{Number, off_hook} ->
			stop_ringing(),
			connected(Number)
	end.

start_ringing() -> ok.
start_tone()   -> ok.
stop_ringing() -> ok.

connected(Number) -> Number.
dial() -> ok. 