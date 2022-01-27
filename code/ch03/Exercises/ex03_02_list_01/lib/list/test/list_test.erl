-module(list_test).

-import(list,[create/1]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

list_test() ->
  ?assert([] =:= create(0)),
  ?assert([1] =:= create(1)),
  ?assert([1,2] =:= create(2)),
  ?assert([1,2,3] =:= create(3)),

  ?assertError(function_clause, create(-1)),
  ?assertError(function_clause, create(1.2)),
  ?assertError(function_clause, create(ok)),
  ?assertError(function_clause, create([])),
  ?assertError(function_clause, create({ok,ok}))
  
  .

long_time_test_() ->
{timeout, 200,
    [
      {"Generate a big list",  fun big_list1/0}
    ]}.

big_list1() ->
	?assert(lists:seq(1,1000) =:= create(1000)).

-endif.
