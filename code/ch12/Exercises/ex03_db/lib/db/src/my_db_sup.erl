-module(my_db_sup).

-behavior(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).
  

init(_Args) ->
	SupFlags = #{startegy => one_for_all, intensity => 5, period => 60*60},
	
	DbChild = #{id => db, 
				 start => {my_db_gen, start_link, []},
				 restart => temporary,
				 shutdown => brutal_kill,
				 type => worker,
				 modules => [my_db_gen, db]},
	
	ChildSpecs = [DbChild],
	
	{ok, {SupFlags, ChildSpecs}}.  
