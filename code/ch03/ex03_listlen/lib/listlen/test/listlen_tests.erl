-module(listlen_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"listlen function", fun listlen_fun/0},
     {"listlen2 function", fun listlen2_fun/0},
     {"listlen_tail function", fun listlen_tail_fun/0},
     {"listlen2_tail function", fun listlen2_tail_fun/0}].

listlen_fun() ->
    ?assertEqual(0, (chapter3:listlen([]))),
    ?assertEqual(10, (chapter3:listlen(lists:seq(1, 10)))),
    ?assertEqual(100,
                 (chapter3:listlen(lists:seq(1, 100)))),
    ?assertError(function_clause, (chapter3:listlen({list, 10}))).

listlen2_fun() ->
    ?assertEqual(0, (chapter3:listlen2([]))),
    ?assertEqual(10, (chapter3:listlen2(lists:seq(1, 10)))),
    ?assertEqual(100,
                 (chapter3:listlen2(lists:seq(1, 100)))),
    ?assertException(error, {case_clause, _}, (chapter3:listlen2({list, 10}))).
                 
listlen_tail_fun() ->
    ?assertEqual(0, (listlen:listlen_tail([]))),
    ?assertEqual(10,
                 (listlen:listlen_tail(lists:seq(1, 10)))),
    ?assertEqual(100,
                 (listlen:listlen_tail(lists:seq(1, 100)))),
    ?assertError(function_clause, (listlen:listlen_tail({list, 10}))).

listlen2_tail_fun() ->
    ?assertEqual(0, (listlen:listlen2_tail([]))),
    ?assertEqual(10,
                 (length(lists:seq(1, 10)))),
    ?assertEqual(10,
                 (listlen:listlen2_tail(lists:seq(1, 10)))),
    ?assertEqual(100,
                 (listlen:listlen2_tail(lists:seq(1, 100)))),
    ?assertException(error, {case_clause, _}, (listlen:listlen2_tail({list, 10}))).

-endif.
