-module(quicksort_test).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").


sort_test() ->
	?assertEqual([], quicksort:sort([])),
	?assertEqual([1,2,3,4], quicksort:sort([3,2,1,4]))
	.

	
-endif.
