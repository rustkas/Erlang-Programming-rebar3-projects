-module(add_three).

-export([start/0, request/1, loop/0]).
-export([check_messages/0]).
-export([send_exit/0,restart/0]).

start() ->
  process_flag(trap_exit, true),
  Pid = spawn_link(add_three, loop, []),
  register(add_three, Pid),
  Reference = erlang:monitor(process, Pid),
  {ok, Pid, Reference}.

request(Int) ->
  is_started(),
  add_three ! {request, self(), Int},
  check_messages().		
  

loop() ->
  receive
    {request, Pid, Msg} ->
       Pid ! {result, Msg + 2};
	exit ->
		exit(normal);
	{restart, Pid} ->
		%exit(Pid, normal)
		exit(Pid, normal)
  end,
  loop().


send_exit() ->
	is_started(),
	add_three ! exit,
	check_messages().	

restart() ->
	is_started(),
	add_three ! {restart, self()},
	check_messages().	

% inner functions

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

is_started() ->
	case whereis(add_three) =:= undefined of 
		true -> throw(noproc);
		false -> ok
	end.