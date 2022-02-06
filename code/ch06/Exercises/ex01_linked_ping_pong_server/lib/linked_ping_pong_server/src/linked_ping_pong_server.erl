-module(linked_ping_pong_server).

-export([go/0, loop/0, stop/0]).

go() ->
   Pid = spawn_link(linked_ping_pong_server, loop, []),
   Pid ! {self(), true},
   receive
     {Pid, Msg} ->
       io:format("~w~n",[Msg])
   end,
   Pid.


loop() ->
   process_flag(trap_exit, true),
   receive
     {From, Msg} ->
        From ! {self(), Msg},
        loop();
     stop ->
       true;
	 {'EXIT', _Pid, Reason} -> 
		io:format("EXIT. Reason = ~p~n", [Reason]),
		{error, Reason}
	  Result ->
	  io:format("Result = ~p~n", [Result])
   end.

stop() ->
	exit(ok).