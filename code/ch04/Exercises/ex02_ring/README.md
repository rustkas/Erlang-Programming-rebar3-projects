ex02_ring
=====

rebar3 new lib ex02_ring && cd ex02_ring && rm -R src && mkdir lib && cd lib && rebar3 new lib ring && cd ..

An OTP library

An OTP library

Build
-----

	$ rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	> 
	
```
PidList = ring:start_proc(2).
PidList = ring:start_proc(10).
IdNumberList = lists:seq(1,10),
IdList = lists:map(fun(Id) -> integer_to_list(Id) end, IdNumberList).
IdList = lists:map(fun(Id) -> integer_to_list(Id) end, lists:seq(1,10)) ++ [stop].
FirstPid = hd(PidList).
lists:foreach(fun(Pid) -> Pid ! next_pid end, PidList).
lists:foreach(fun(Message) -> FirstPid ! Message end, IdList).

lists:foreach(fun(Pid) -> is_process_alive(Pid) end, PidList).


lists:foreach(fun(Pid) -> io:format("Pid=~p. Is alive=~p.~n",[Pid, is_process_alive(Pid)]) end, PidList).

lists:foreach(fun(Pid) -> Pid ! stop end, PidList).

```	

```
ring:start(10,2,"Hello, Erlang!").
```