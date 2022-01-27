-module(quicksort).

-export([sort/1]).

sort([]) -> [];
sort([Head | Tail]) ->
	sort([Item || Item <- Tail, Item =< Head]) ++ [Head] ++ sort([Item || Item <- Tail, Item > Head]).