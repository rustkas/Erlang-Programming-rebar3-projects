-module(boolean_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->

    [
     {"b_not",  fun b_not/0},
     {"b_and",  fun b_and/0},
     {"b_or",  fun b_or/0},
     {"b_nand", fun b_nand/0}
    ].

b_not()->
    ?assertEqual(not true, boolean:b_not(true)),
    ?assertEqual(not false, boolean:b_not(false)).

b_and()->
    ?assertEqual(true and true, boolean:b_and(true, true)),
    ?assertEqual(true and false, boolean:b_and(true, false)),
    ?assertEqual(false and true, boolean:b_and(false, true)),
    ?assertEqual(false and false, boolean:b_and(false, false)).

b_or()->
    ?assertEqual(true or true, boolean:b_or(true, true)),
    ?assertEqual(true or false, boolean:b_or(true, false)),
    ?assertEqual(false or true, boolean:b_or(false, true)),
    ?assertEqual(false or false, boolean:b_or(false, false)).

b_nand() ->
    ?assertEqual(not (true and true), boolean:b_nand(true, true)),
    ?assertEqual(not (true and false), boolean:b_nand(true, false)),
    ?assertEqual(not (false and true), boolean:b_nand(false, true)),
    ?assertEqual(not (false and false), boolean:b_nand(false, false)).

-endif.