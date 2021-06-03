-module(meta_programming).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [
      {"Try to use apply/2", fun apply_2_examples/0},
      {"Try to use apply/3", fun apply_3_examples/0},
      {"Lounch listlen/1", fun lounch_listlen/0}
      ].

apply_2_examples() ->
    FunEven = fun examples:even/1,
    ?assert(is_function(FunEven)),
    Result_10 = apply(FunEven, [10]),
    Result_10,
    ?assert(Result_10),
    % ?debugFmt("~n~p~n", [Result_10]),
    ok.

apply_3_examples()->
  Module = examples,
  Function = even,
  Arguments = [10],
  Result_10 = apply(Module, Function, Arguments),
  ?assert(Result_10),
  ok.

lounch_listlen()->
  
  ?assertError(undef, apply(sequential, listlen, [2,3,4])),
  ?assertEqual(3, apply(sequential, listlen, [[2,3,4]])),
  ok.
-endif.
