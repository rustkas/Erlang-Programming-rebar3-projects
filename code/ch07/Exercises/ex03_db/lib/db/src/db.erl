-module(db).

-export([new/0,destroy/1,write/3,read/2,match/2,delete/2,db/1]).
-include("db.hrl").

new() -> [].

destroy(_Db) -> ok.

write(Key, Value, Db) when is_list(Db) ->
	[#data{key=Key,data=Value} | Db].

db(Db) when is_list(Db) ->
	 [ D || D <- Db].

read(Key, Db) when is_list(Db) ->
	ResultList = [ D#data.data || D <- Db, Key =:= D#data.key],
	case ResultList of 
	    [] -> {error, instance};
		[Head|_T] -> {ok, Head}
	end.

match(Element, Db) when is_list(Db) ->
	[D#data.key || D <- Db, Element =:= D#data.data].

delete(Key, Db) when is_list(Db) ->
	[D || D <- Db, Key =/= D#data.key].
	 