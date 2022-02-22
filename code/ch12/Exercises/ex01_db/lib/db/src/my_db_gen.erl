-module(my_db_gen).


-export([start/0,stop/0]).
-export([write/2, delete/1, read/1, match/1, db/0]).
-export([init/1, handle_call/3, handle_cast/2]).

-behavior(gen_server).

start() ->
	gen_server:start_link({local, ?MODULE}, ?MODULE, [], []),
	ok.

stop() ->
  gen_server:cast(?MODULE, stop).

%terminate(_Reason, _LoopData) ->
%  ok. 

init(_Agrgs) ->
  Db = db:new(),
  {ok, Db}.
  
write(Key, Element) ->
	gen_server:call(?MODULE, {write, Key, Element}).  

delete(Key) ->
	gen_server:call(?MODULE, {delete, Key}).  

read(Key) ->
	gen_server:call(?MODULE, {read, Key}).

match(Element) ->
	gen_server:call(?MODULE, {match, Element}).
	
db() ->
	gen_server:call(?MODULE, db).
handle_call({write, Key, Element}, _From, Db) ->
	NewDb = db:write(Key, Element, Db),
	{reply, ok, NewDb};
handle_call({delete, Key}, _From, Db) ->
	NewDb = db:delete(Key, Db),
	{reply, ok, NewDb};
handle_call({read, Key}, _From, Db) ->
	ResultTuple = db:read(Key, Db),
	{reply, ResultTuple, Db};
handle_call({match, Element}, _From, Db) ->	
	ResultList = db:match(Element, Db),
	{reply, ResultList, Db};
handle_call(db, _From, Db) ->	
	{reply, Db, Db}.	
	
handle_cast(stop, LoopData) ->
  {stop, normal, LoopData}.