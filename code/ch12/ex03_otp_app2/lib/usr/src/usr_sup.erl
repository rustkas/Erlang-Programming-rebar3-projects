-module(usr_sup).
-behavior(supervisor).
-behaviour(application).

% app functions
-export([start/2, stop/1]).

-export([start_link/0]).
-export([init/1]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init(_Args) ->
	SupFlags = #{startegy => one_for_all, intensity => 1, period => 1},
	
	UsrChild = #{id => usr, 
				 start => {usr, start_link, []},
				 restart => temporary,
				 shutdown => brutal_kill,
				 type => worker,
				 modules => [usr, usr_db]},
	
	ChildSpecs = [UsrChild],
	
	{ok, {SupFlags, ChildSpecs}}.


% app functions

start(_Type, _StartArgs) ->
    usr_sup:start_link().

stop(_State) ->
    ok.
