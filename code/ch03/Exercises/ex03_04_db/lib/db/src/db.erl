-module(db).

-export([new/0,destroy/1,write/3,read/2,delete/2,match/2]).


new() -> [].

destroy(_Db) -> ok.

write(Key, Element, Db) when is_list(Db) ->
	[{Key, Element} | Db].

read(Key, Db) when is_list(Db) ->
	ResultList = [ ValueItem || {KeyItem,ValueItem} <- Db, Key =:= KeyItem],
	case ResultList of 
	    [] -> {error, instance};
		[Head|_T] -> {ok, Head}
	end.	

delete(Key, Db) when is_list(Db) ->
	[{KeyItem,ValueItem} || {KeyItem,ValueItem} <- Db, Key =/= KeyItem].
	
match(Element, Db) when is_list(Db) ->
	[KeyItem || {KeyItem,ValueItem} <- Db, Element =:= ValueItem].