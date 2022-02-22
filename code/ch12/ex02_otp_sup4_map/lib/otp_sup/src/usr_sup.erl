%% Code from 
%%   Erlang Programming
%%   Francecso Cesarini and Simon Thompson
%%   O'Reilly, 2008
%%   http://oreilly.com/catalog/9780596518189/
%%   http://www.erlangprogramming.org/
%%   (c) Francesco Cesarini and Simon Thompson

-module(usr_sup).
-behavior(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init(_Args) ->
	SupFlags = #{startegy => one_for_all, intensity => 1, period => 1},
	%{RestartStrategy, AllowedRestarts, MaxSeconds} = {one_for_all, 1, 1},
	%SupervisorSpecifications = {RestartStrategy, AllowedRestarts, MaxSeconds},
	
	
	%{Id, {Module, Function, Arguments}, Restart, Shutdown, Type, ModuleList} = {usr, {usr, start_link, []}, 
	%temporary, 2000, worker, [usr, usr_db]},
	%UsrChild = {Id, {Module, Function, Arguments}, Restart, Shutdown, Type, ModuleList},
	
	UsrChild = #{id => usr, 
				 start => {usr, start_link, []},
				 restart => temporary,
				 shutdown => brutal_kill,
				 type => worker,
				 modules => [usr, usr_db]},
	
	ChildSpecs = [UsrChild],
	
	{ok, {SupFlags, ChildSpecs}}.
