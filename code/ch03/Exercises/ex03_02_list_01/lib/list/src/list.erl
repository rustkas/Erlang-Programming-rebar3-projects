-module(list).

-export([create/1]).

create(ListLength) when is_integer(ListLength), ListLength >= 0 ->
	create_acc(ListLength, 1, []).

create_acc(ListLength, _Item, AccList) when ListLength =:= length(AccList) ->
	AccList;
create_acc(ListLength, Item, AccList) when ListLength > length(AccList) ->
	create_acc(ListLength, Item+1, AccList ++ [Item]).
	
	