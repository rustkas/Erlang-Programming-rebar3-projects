-module(break_proc).

-export([exit_proc_link/0, exit_atom_proc_link/0, fun_exit/0]).
-export([exit_proc_link2/0]).
-export([exit_proc_monitor/0,exit_proc_monitor2/0]).

exit_proc_link() ->
	Link = link(Pid = spawn(break_proc, fun_exit, [])),
	{Link,Pid}.

exit_proc_link2() ->
	Pid = spawn(break_proc, fun_exit, []),
	case is_process_alive(Pid) of
		false -> throw(badarg);
		true -> ok
	end,	
	Link = link(Pid),
	case Link of
		true -> ok;
		false -> throw(badarg)
	end,
	Pid.

exit_atom_proc_link() ->
	Pid = spawn_link(break_proc, fun_exit, []),
	Pid.

exit_proc_monitor() ->
	Ref = erlang:monitor(process, Pid = spawn(break_proc, fun_exit, [])),
	{Ref,Pid}.

exit_proc_monitor2() ->
	{Pid, Ref} = erlang:spawn_monitor(break_proc, fun_exit, []),
	{Ref,Pid}.

fun_exit() ->
	io:format("Function has run = ~p~n",[true]),
	exit(ok).