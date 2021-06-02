-module(index_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Check chapter3:index", fun index/0},
     {"Check chapter3:index2", fun index2/0},
     {"Check index:value_of_case", fun value_of_case/0},
     {"Check chapter3:index3", fun index3/0},
     {"Check index:value_of_inner_case",
      fun value_of_inner_case/0}].

index() ->
    List = [1, 2, 3],
    ?assertEqual(1, (chapter3:index(0, List))),
    ?assertEqual(2, (chapter3:index(1, List))),
    ?assertEqual(3, (chapter3:index(2, List))),
    ?assertError(function_clause,
                 (chapter3:index(3, List))).

index2() ->
    List = [1, 2, 3],
    ?assertEqual(1, (chapter3:index2(0, List))),
    ?assertEqual(2, (chapter3:index2(1, List))),
    ?assertEqual(3, (chapter3:index2(2, List))),
    ?assertException(error, {case_clause, _},
                     (chapter3:index2(3, List))).

value_of_case() ->
    List = [1, 2, 3],
    ?assertEqual(1, (index:value_of_case(0, List))),
    ?assertEqual(2, (index:value_of_case(1, List))),
    ?assertEqual(3, (index:value_of_case(2, List))),
    ?assertException(error, {case_clause, _},
                     (index:value_of_case(3, List))).

index3() ->
    List = [1, 2, 3],
    ?assertEqual(1, (chapter3:index3(0, List))),
    ?assertEqual(2, (chapter3:index3(1, List))),
    ?assertEqual(3, (chapter3:index3(2, List))),
    ?assertException(error, {case_clause, _},
                     (chapter3:index3(3, List))).

value_of_inner_case() ->
    List = [1, 2, 3],
    ?assertEqual(1, (index:value_of_inner_case(0, List))),
    ?assertEqual(2, (index:value_of_inner_case(1, List))),
    ?assertEqual(3, (index:value_of_inner_case(2, List))),
    ?assertException(error, {case_clause, _},
                     (index:value_of_inner_case(3, List))).

-endif.
