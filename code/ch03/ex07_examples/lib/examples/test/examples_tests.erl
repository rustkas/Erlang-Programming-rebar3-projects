-module(examples_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Check even", fun even/0},
     {"Check number", fun number/0},
     {"Check divide", fun divide/0}].

even() ->
    % ?debugFmt("~n~p~n", [  examples:even(2)]),
    ?assert((examples:even(0))),
    ?assertEqual(false, (examples:even(1))),
    ?assert((examples:even(2))),
    ?assert((examples:even(4))),
    ?assert((examples:even(6))),
    ?assertError(function_clause, (examples:even(2.0))),
    ?assertError(function_clause, (examples:even(two))),
    ?assertError(function_clause, (examples:even("two"))),
    ?assertError(function_clause, (examples:even([]))),
    ?assertError(function_clause,
                 (examples:even({ok, ok, ok}))),
    ok.

number() ->
    ?assertEqual(integer, (examples:number(1))),
    ?assertEqual(float, (examples:number(1.0))),
    ?assertEqual(false, (examples:number([1.0]))),
    ?assertEqual(false, (examples:number(self()))),
    ?assertEqual(false, (examples:number(make_ref()))),
    ok.

divide() ->
    ?assertEqual(0, (examples:divide(0))),
    ?assertEqual(1, (examples:divide(1))),
    ?assertError(function_clause, (examples:divide(2.0))),
    ?assertError(function_clause, (examples:divide(two))),
    ?assertError(function_clause, (examples:divide("two"))),
    ?assertError(function_clause, (examples:divide([]))),
    ?assertError(function_clause,
                 (examples:divide({ok, ok, ok}))),
    ok.

-endif.
