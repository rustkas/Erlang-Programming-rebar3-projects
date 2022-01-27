-module(db).

-export([new/0,destroy/1,write/3,read/2,delete/2,match/2]).


new() -> [].

destroy(_Db) -> ok.

write(Key, Element, Db) when is_list(Db) ->
	[{Key, Element} | Db].

read(Key, Db) when is_list(Db) ->
	Result = lists:keyfind(Key, 1, Db),
	case Result of 
	    false -> {error, instance};
		{_,Value} -> {ok, Value}
	end.	

delete(Key, Db) when is_list(Db) ->
    lists:keydelete(Key, 1, Db).	
	
match(Element, Db) when is_list(Db) ->
    [KeyItem || {KeyItem,ValueItem} <- Db, Element =:= ValueItem].
