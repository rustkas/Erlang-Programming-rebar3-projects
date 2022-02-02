-module(ring).

-export([start/3,loop/1]).
-export([start_proc/1]).

%% @doc Create N processes connected in a ring.
%%  Once started, these processes will send M number 
%% of messages around the ring and then terminate gracefully 
%% when they receive a quit message.
%% 
%% @param M the message count
%% @param N the processe count
%% @returns ok

-spec start(M,N,Message) -> ok when
	M :: non_neg_integer(),
	N :: non_neg_integer(),
	Message :: term().
	
start(M, N, Message) ->
	%launch N procceses
	PidList = start_proc(N),
	
	IdList = lists:duplicate(M, Message) ++ [stop],
	FirstPid = hd(PidList),
	lists:foreach(fun(ListMessage) -> FirstPid ! ListMessage end, IdList),
	lists:foreach(fun(Pid) -> Pid ! stop end, PidList),
	lists:all(fun(Pid) -> is_process_alive(Pid) end, PidList).

start_proc(N) when N > 1 ->
	FirstPid = spawn(ring, loop, [self()]),
	PidList = start_proc(N-1,FirstPid,FirstPid,[FirstPid]),
	PidList.
	
start_proc(0,Pid,FirstPid,PidList) ->
	Pid ! FirstPid,
	PidList;
start_proc(N,Pid,FirstPid,PidList) ->	
	NewPid = spawn(ring, loop, [ok]),
	Pid ! NewPid,
	start_proc(N-1, NewPid, FirstPid, PidList ++ [NewPid]).

loop(Pid) ->
   receive
     stop ->
	   io:format("Pid=~p is stoped.~n",[self()]),
       true;
	 next_pid ->
		io:format("Next Pid =~p.~n",[Pid]),
		loop(Pid);
	 NewPid when is_pid(NewPid) ->
        io:format("Pid responce is ~p.~n",[NewPid]),
		loop(NewPid);
     Msg when is_list(Msg) ->
        io:format("Pid=~p. Message=~p.~n",[self(), Msg]),
        Pid ! Msg,
		loop(Pid)
   end.
