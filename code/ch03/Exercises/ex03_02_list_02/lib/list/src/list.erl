-module(list).

-export([reverse_create/1]).

reverse_create(ListLength) when is_integer(ListLength), ListLength >= 0 ->
	reverse_create_acc(ListLength, 1, []).

reverse_create_acc(ListLength, _Item, AccList) when ListLength =:= length(AccList) ->
	AccList;
reverse_create_acc(ListLength, Item, AccList) when ListLength > length(AccList) ->
	reverse_create_acc(ListLength, Item+1, [Item | AccList]).
	
	