-module(list_test).

-import(format,[reverse_create/1]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

list_test() ->
  ?assert([] =:= reverse_create(0)),
  ?assert([1] =:= reverse_create(1)),
  ?assert([2,1] =:= reverse_create(2)),
  ?assert([3,2,1] =:= reverse_create(3)),

  ?assertError(function_clause, reverse_create(-1)),
  ?assertError(function_clause, reverse_create(1.2)),
  ?assertError(function_clause, reverse_create(ok)),
  ?assertError(function_clause, reverse_create([])),
  ?assertError(function_clause, reverse_create({ok,ok}))
  
  .

long_time_test_() ->
{timeout, 200,
    [
      {"Generate a big list",  fun big_list1/0}
    ]}.

big_list1() ->
	?assert(lists:reverse(lists:seq(1,1000)) =:= reverse_create(1000)).

-endif.
