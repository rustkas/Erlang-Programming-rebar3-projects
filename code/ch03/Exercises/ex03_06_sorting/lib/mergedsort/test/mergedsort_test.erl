-module(mergedsort_test).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").


sort_test() ->
	?assertEqual([], quicksort:sort([])),
	?assertEqual([1,2,3,4], mergedsort:sort([3,2,1,4])),
	?assertEqual([1,2,3,4,5], mergedsort:sort([3,2,5,1,4]))
	.

	
-endif.
