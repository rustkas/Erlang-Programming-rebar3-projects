-module(variable_scope_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Check f function", fun f/0},
     {"Check score using 'case of'. Catch 'badmatch'",
      fun scope1/0},
     {"Using exported variables from 'case'",
      fun scope2_1/0},
     {"Using exported variables from 'case'",
      fun scope2_2/0},
     {"Make unused variable. Get exported variable "
      "from 'case'",
      fun scope3_1/0},
     {"Make unused variable. Get exported variable "
      "from 'case'",
      fun scope3_2/0},
     {"Guard casee clause", fun scope4/0},
     {"Use variables from 'case' scopes", fun scope5/0},
     {"Init variable in a patucular 'case' "
      "scope",
      fun scope6/0},
     {"Check g function", fun g_1/0},
     {"Check g function", fun g_2/0},
     {"Check unsafe function", fun unsafe/0},
     {"Check safe function", fun safe/0},
     {"Check safe function with guard", fun safe_guard/0},
     {"Check preferred function", fun preferred/0},
     {"Check preferred function with guard",
      fun preferred_guard/0},
     {"Check 'if' gard functions", fun check_if_01/0},
     {"Check using 'true' 'if' gard function",
      fun check_if_02/0},
     {"Check using input", fun check_x/0},
     {"Check any input", fun check_any/0},
     {"Try to use calculate_rem_if and calculate_rem"
      "_case functions",
      fun calculate_rem/0}].

f() ->
    ?assertEqual(0, (chapter3:f(0))),
    ?assertEqual(2, (chapter3:f(1))),
    ?assertEqual(6, (chapter3:f(2))).

scope1() ->
    List = [],
    ?assertException(error, {badmatch, _},
                     (variable_scope:scope1(List))).

scope2_1() ->
    List = [],
    ?assertEqual(4, (variable_scope:scope2(List))).

scope2_2() ->
    List = [0],
    ?assertError(badarg, (variable_scope:scope2(List))).

scope3_1() ->
    List = [],
    ?assertEqual(3, (variable_scope:scope3(List))).

scope3_2() ->
    List = [0],
    % Produce an error in erlang:hd/1 function
    ?assertError(badarg, (variable_scope:scope3(List))).

scope4() ->
    List = [0],
    ?assertException(error, {case_clause, _},
                     (variable_scope:scope4(List))).

scope5() ->
    List = [],
    ?assertEqual(8, (variable_scope:scope5(List))).

scope6() ->
    List = [],
    ?assertEqual(0, (variable_scope:scope6(List))).

g_1() ->
    List = [],
    ?assertEqual(0, (chapter3:g(List))).

g_2() ->
    List = [1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1],
    ?assertEqual(7, (chapter3:g(List))).

unsafe() ->
    ?assertEqual(one, (variable_scope:unsafe(one))),
    ?assertEqual(two, (variable_scope:unsafe(two))).

safe() ->
    % 'atom + number' expression raises an error
    ?assertError(badarith, (chapter3:safe(one))),
    ?assertError(badarith, (chapter3:safe(two))).

safe_guard() ->
    ?assertError(function_clause,
                 (variable_scope:safe(one))),
    ?assertError(function_clause,
                 (variable_scope:safe(two))),
    ?assertEqual(196, (variable_scope:safe(0))),
    ?assertEqual(196.0, (variable_scope:safe(0.0))).

preferred() ->
    ?assertError(badarith, (chapter3:preferred(one))),
    ?assertError(badarith, (chapter3:preferred(two))).

preferred_guard() ->
    ?assertError(function_clause,
                 (variable_scope:preferred(one))),
    ?assertError(function_clause,
                 (variable_scope:preferred(two))),
    ?assertEqual(196, (variable_scope:preferred(0))),
    ?assertEqual(196.0, (variable_scope:preferred(0.0))).

check_if_01() ->
    ?assert((variable_scope:check_if_01({ok}))).

check_if_02() ->
    ?assertEqual(number, (variable_scope:check_if_02(0))),
    ?assert((variable_scope:check_if_02(0.0))),
    ?assert((variable_scope:check_if_02([0.0]))),
    ?assert((variable_scope:check_if_02({0.0}))),
    ?assert((variable_scope:check_if_02(<<0>>))).

check_x() ->
    ?assertError(function_clause,
                 (variable_scope:check_x(one))),
    ?assertEqual(smaller, (variable_scope:check_x(0))),
    ?assertEqual(greater, (variable_scope:check_x(2))),
    ?assertEqual(equal, (variable_scope:check_x(1))).

check_any() ->
    ?assertEqual(smaller, (variable_scope:check_any(0))),
    ?assertEqual(greater, (variable_scope:check_any(2))),
    ?assertEqual(equal, (variable_scope:check_any(1))),
    ?assertEqual(equal, (variable_scope:check_any(one))),
    ?assertEqual(equal, (variable_scope:check_any("OnE"))),
    ?assertEqual(equal,
                 (variable_scope:check_any(<<"ONE">>))),
    ?assertEqual(equal,
                 (variable_scope:check_any(["ONE"]))),
    ?assertEqual(equal, (variable_scope:check_any({ok}))).

calculate_rem() ->
    ?assertEqual(undefined,
                 (variable_scope:calculate_rem_if([0]))),
    ?assertEqual(undefined,
                 (variable_scope:calculate_rem_case([0]))),
    ?assertEqual(even,
                 (variable_scope:calculate_rem_if(0))),
    ?assertEqual(even,
                 (variable_scope:calculate_rem_case(0))),
    ?assertEqual(odd, (variable_scope:calculate_rem_if(1))),
    ?assertEqual(odd,
                 (variable_scope:calculate_rem_case(1))),
    ?assertEqual(even,
                 (variable_scope:calculate_rem_if(2))),
    ?assertEqual(even,
                 (variable_scope:calculate_rem_case(2))),
    ?assertEqual(even,
                 (variable_scope:calculate_rem_if(4))),
    ?assertEqual(even,
                 (variable_scope:calculate_rem_case(4))).

-endif.
