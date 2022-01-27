-module(sum_test).

-import(sum,[sum/2]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

sum1_test() ->
  ?assert((6 =:= sum(1,3)))
	,?assert((6 =:= sum(6,6)))
	.

-endif.
