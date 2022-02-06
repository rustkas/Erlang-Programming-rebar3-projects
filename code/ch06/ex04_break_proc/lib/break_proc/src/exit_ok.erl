-module(exit_ok).

-export([start/0,loop/0,normal_start/0]).
-export([check_messages/0]).
-export([normal_exit_1/0,normal_exit_2/0]).
-export([kill_exit_01/0,kill_exit_02/0]).
-export([unnormal_exit_1/0]).

start() ->
  process_flag(trap_exit, true),
  Pid = spawn_link(exit_ok, loop, []),
  register(exit_ok, Pid),
  Reference = erlang:monitor(process, Pid),
  {ok, Pid, Reference}.
  
normal_start() ->
  process_flag(trap_exit, false),
  Pid = spawn_link(exit_ok, loop, []),
  register(exit_ok, Pid),
  Reference = erlang:monitor(process, Pid),
  {ok, Pid, Reference}.  
  
loop() ->
  receive
	{exit, Pid, {ok,1}} ->
		Pid ! ok;
	{exit, Pid, {ok,2}} ->	
		exit(normal),
		Pid ! ok;
	{exit, Pid, ok} ->		
		exit(ok),
		Pid ! ok;
	{exit, Pid, kill} ->		
		Pid ! ok,
		exit(kill);
	{exit, Pid, kill_back} ->		
		Pid ! kill,
		exit(kill)
		
  end.  


normal_exit_1() ->
	exit_ok ! {exit, self(), {ok,1}},
	check_messages().

normal_exit_2() ->
	exit_ok ! {exit, self(), {ok,2}},
	check_messages().

unnormal_exit_1() ->
	exit_ok ! {exit, self(), ok},
	check_messages().

kill_exit_01() ->
	exit_ok ! {exit, self(), kill},
	check_messages().
	
kill_exit_02() ->
	exit_ok ! {exit, self(), kill_back},
	check_messages().	

check_messages() ->
  receive
    {result, Result}      -> Result;
    {'EXIT', Pid, Reason} -> 
		io:format("Error. Pid = ~p. Reason = ~p~n", [Pid, Reason]);
	{'DOWN', Reference, process, Pid, Reason} -> 
		erlang:demonitor(Reference),
		io:format("Reference = ~p, Pid = ~p, Reason = ~p~n", [Reference, Pid, Reason])
    after 1000            -> timeout
	end.