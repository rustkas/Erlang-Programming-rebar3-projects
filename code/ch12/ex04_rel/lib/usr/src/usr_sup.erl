-module(usr_sup).
-behavior(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init(_Args) ->
	SupFlags = #{startegy => one_for_one, intensity => 5, period => 1},
	
	UsrChild = #{id => db, 
				 start => {my_db_gen, start_link, []},
				 restart => temporary,
				 shutdown => brutal_kill,
				 type => worker,
				 modules => [db, my_db_gen]},
	
	ChildSpecs = [UsrChild],
	
	{ok, {SupFlags, ChildSpecs}}.
