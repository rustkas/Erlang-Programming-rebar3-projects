-module(guards_tests).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Calculate factorial", fun factorial/0},
     {"Calculate factorial with tuned guards",
      fun factorial2/0},
     {"Check guard function", fun guard_check/0},
     {"Check guard2 function", fun guard_check2/0},
     {"Check guard3 function", fun guard_check3/0},
     {"Check guard4 function", fun guard_check4/0}].

factorial() ->
    % ?debugFmt("~n~p~n",[chapter3:factorial(3)]),
    ?assertEqual(1, (chapter3:factorial(0))),
    ?assertEqual(1, (chapter3:factorial(1))),
    ?assertEqual(2, (chapter3:factorial(2))),
    ?assertEqual(6, (chapter3:factorial(3))),
    % expected error
    ?assertError(function_clause,
                 (chapter3:factorial(0.0))),
    ?assertError(function_clause, (chapter3:factorial(-1))),
    % unexpected error (try to multiply number by tuple, list...
    ?assertError(badarith, (chapter3:factorial([0]))),
    ?assertError(badarith, (chapter3:factorial({ok, 0}))).

factorial2() ->
    ?assertEqual(1, (guards:factorial(0))),
    ?assertEqual(1, (guards:factorial(1))),
    ?assertEqual(2, (guards:factorial(2))),
    ?assertEqual(6, (guards:factorial(3))),
    ?assertError(function_clause, (guards:factorial(-1))),
    ?assertError(function_clause, (guards:factorial(0.0))),
    ?assertError(function_clause, (guards:factorial([0]))),
    ?assertError(function_clause,
                 (guards:factorial({ok, 0}))).

guard_check() ->
    % ?debugFmt("~n~p~n", [guards:guard([], ok)]),
    ?assertError(badarith, (guards:guard([], [0]))),
    ?assertEqual(3, (guards:guard(1, 2))).

guard_check2() ->
    ?assertError(function_clause, (guards:guard2([], [0]))),
    ?assertEqual(1, (guards:guard2(1, 2))),
    ?assertEqual(2, (guards:guard2(2, 4))),
    ?assertError(function_clause, (guards:guard2(3.4, 5))),
    ?assertError(function_clause, (guards:guard2(2, 1))).

guard_check3() ->
    ?assertError(function_clause, (guards:guard3([], [0]))),
    ?assertEqual(3, (guards:guard3(1, 2))),
    ?assertEqual(6, (guards:guard3(2, 4))),
    ?assertError(function_clause, (guards:guard2(3.4, 5))),
    ?assertError(function_clause, (guards:guard2(20, 1))).

guard_check4() ->
    ?assertEqual(2.1, (guards:guard4(1.1, 1))),
    ?assertEqual(2.1, (guards:guard4(1, 1.1))),
    ?assertError(function_clause, (guards:guard4(0, 0))),
    ok.

-endif.
