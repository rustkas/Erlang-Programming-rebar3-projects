-module(my_db).

-export([start/0, stop/0, write/2, delete/1, read/1, match/1]).
-export([init/0]).
-export([db/0]).

start() ->
  Pid = spawn(my_db, init, []),
  case register(my_db, Pid) of
	true -> ok;
	false -> throw(badarg)
  end.

init() ->
	Db = db:new(),
	loop(Db).

stop() ->  
	is_started(),
	my_db ! {stop, self()},
	receive ok -> ok end.

write(Key, Element) ->
	is_started(),
	my_db ! {write, self(), {Key, Element} },
	receive ok -> ok end.

delete(Key) ->
	is_started(),
	my_db ! {delete, self(), Key },
	receive ok -> ok end.
	
read(Key) ->
	is_started(),
	my_db ! {read, self(), Key},
	receive 
		{ok, Element} -> {ok, Element};
		_ -> {error, instance}
	end.	

match(Element) ->
	is_started(),
	my_db ! {match, self(), Element},
	receive 
		Result -> Result
	end.

%% print full db
db() ->
	my_db ! {db, self()},
	receive Db -> 
		io:format("~p~n", [Db])
	end.

% inner functions

is_started() ->
	case whereis(my_db) =:= undefined of 
		true -> throw(noproc);
		false -> ok
	end.
	
loop(Db) ->
  receive
    {stop, From} when is_pid(From) ->
      From ! ok;
	{write, From, {Key, Element}} when is_pid(From) ->
		NewDb = db:write(Key, Element, Db),
		From ! ok,
		loop(NewDb);
	{delete, From, Key}	when is_pid(From) ->
		NewDb = db:delete(Key, Db),
		From ! ok,
		loop(NewDb);
	{read, From, Key} when is_pid(From) ->
		ResultTuple = db:read(Key, Db),
		From ! ResultTuple,
		loop(Db);
	{match, From, Element} when is_pid(From) ->	
		ResultList = db:match(Element, Db),
		From ! ResultList,
		loop(Db);
	% extra functionality
	{db, From} when is_pid(From) ->
		From! Db,
		loop(Db)

  end.  

