-module(list_test).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").


filter_test() ->
	?assertEqual([], list:filter([], 3)),
	?assertEqual([1,2,3], list:filter([1,2,3,4,5], 3)),
	
	?assertError(function_clause, list:filter([1,2,3,4,5], 3.0))
	.

reverse_test() ->
	?assertEqual([3,2,1], list:reverse([1,2,3])).

concatenate_test() ->
	?assertEqual([1,2,3,4,five], list:concatenate([[1,2,3], [], [4, five]])).
	
flatten_test() ->
	?assertEqual([1,2,3,4,5,6], list:flatten([[1,[2,[3],[]]], [[[4]]], [5,6]])).
	
-endif.
