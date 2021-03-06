-module(sum_test).

-import(sum,[sum1/1,sum2/1]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

sum1_test() ->
  ?assert((1 =:= sum2(1))),
	?assertError(function_clause, sum2(-1)),
	?assertError(function_clause, sum2(0)),
	?assertError(function_clause, sum2(-1.1)),
	?assert((15 =:= sum2(5)))
	.


%-ifdef(IGNORE).
sum2_test() ->
  ?assert((1 =:= sum2(1))),
	?assertError(function_clause, sum2(-1)),
	?assertError(function_clause, sum2(0)),
	?assertError(function_clause, sum2(-1.1)),
	
	?assert((15 =:= sum2(5))).
%-endif.


-endif.
