-module(supervisor).
-export([start_link/2, stop/1]).
-export([init/1]).
-export([restart_child/2]).


start_link(Name, ChildSpecList) ->
  register(Name, spawn_link(supervisor, init, [ChildSpecList])), ok.

init(ChildSpecList) ->
  process_flag(trap_exit, true),
  loop(start_children(ChildSpecList)).

start_children([]) -> [];
start_children([{M, F, A,Type} | ChildSpecList]) ->
  try apply(M,F,A) of
    {ok, Pid} ->
      [{Pid, {M,F,A,Type}}|start_children(ChildSpecList)];
    _ ->
	  
      start_children(ChildSpecList)
  catch
	error:Reason:Stk -> {'EXIT',{Reason,Stk}}
  
  end.

%% The loop of the supervisor waits in a receive clause for EXIT and stop messages. 
%% If a child terminates, the supervisor receives the EXIT signal and restarts the terminated 
%% child, replacing its entry in the list of children stored in the ChildList variable:

restart_child(Pid, ChildList) ->
  {value, {Pid, {M,F,A,_Type}}} = lists:keysearch(Pid, 1, ChildList),
  
  {ok, NewPid} = apply(M,F,A),
  [{NewPid, {M,F,A}}|lists:keydelete(Pid,1,ChildList)].

loop(ChildList) ->
  receive
    {'EXIT', Pid, Reason} ->
	  %io:format("Reason = ~p~n",[Reason]),	
	  case Reason of 
		normal ->
			NewChildList = restart_child(Pid, ChildList),
			loop(NewChildList);
		_ ->
			Filter = fun(Elem) -> 
			%io:format("Elem = ~p~n",[Elem]),	
			{_,{_,_,_,Type}} = Elem,
			io:format("Type = ~p~n",[Type]),
				case Type of 
					 transient -> true;
					 permanent -> false
				end
			end,
			FilteredChildList = lists:filter(Filter, ChildList),
			NewChildList = restart_child(Pid, FilteredChildList),
			io:format("NewChildList = ~p~n",[NewChildList]),	
			loop(NewChildList)	
	   end;		
    {stop, From}  ->
      From ! {reply, terminate(ChildList)}
  end.

%% We stop the supervisor by calling the synchronous client function stop/0. Upon receiving the 
%% stop message, the supervisor runs through the ChildList, terminating the children one by one.
%% Having terminated all the children, the atom ok is returned to the process that initiated 
%% the stop call:

stop(Name) ->
  Name ! {stop, self()},
  receive {reply, Reply} -> Reply end.

terminate([{Pid, _} | ChildList]) ->
  exit(Pid, kill),
  terminate(ChildList);
terminate(_ChildList) -> ok.
