-module(list).

-export([filter/2,reverse/1,concatenate/1, flatten/1]).

filter(List, Value) when is_list(List), is_integer(Value) ->
	[ Item || Item <- List, Value >= Item].

reverse(List)  when is_list(List) -> lists:reverse(List).

concatenate(List)  when is_list(List) -> 
	concatenate_acc(List, []).

concatenate_acc([], AccList) -> AccList;
concatenate_acc([Head | Tail], AccList) -> 
	concatenate_acc(Tail, AccList ++ Head).

flatten(List) when is_list(List) -> 
	flatten_acc(List,[]).

flatten_acc([],AccList) -> AccList;
flatten_acc([Head|Tail],AccList) when is_list(Head) ->
	flatten_acc(Tail, AccList ++ flatten_acc(Head,[]));
flatten_acc([Head|Tail],AccList) ->	
	flatten_acc(Tail, AccList ++ [Head]).
		