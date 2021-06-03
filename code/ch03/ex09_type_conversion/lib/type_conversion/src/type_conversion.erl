-module(type_conversion).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"atom_to_list", fun atom_to_list_examples/0},
     {"list_to_atom", fun list_to_atom_examples/0},
     {"list_to_atom", fun list_to_existing_atom_examples/0},
     {"list_to_tuple", fun list_to_tuple_examples/0},
     {"tuple_to_list", fun tuple_to_list_examples/0},
     {"Working with float", fun float_examples/0},
     {"Working with integer", fun integer_examples/0},
     {"round", fun round_examples/0},
     {"trunc", fun trunc_examples/0},
     {"float problems", fun float_problems/0}].

atom_to_list_examples() ->
    ?assertEqual("Erlang", (erlang:atom_to_list('Erlang'))),
    ?assertEqual("你好", (atom_to_list('你好'))),
    ok.

list_to_atom_examples() ->
    OkResult = list_to_atom("ok"),
    ?assertEqual(ok, OkResult),
    ?assertEqual('michał', (list_to_atom("michał"))),
    ?assertEqual('абвгдеёжзийклмнопрстуфхцчшщъыьэюя',
                 (list_to_atom("абвгдеёжзийклмнопрстуфхцчшщъыьэюя"))),
    ok.

list_to_existing_atom_examples() ->
    ?assertEqual(ok, (list_to_existing_atom("ok"))),
    %these atom already in game - created by previous tests (side effect)
    ?assertEqual('michał',
                 (list_to_existing_atom("michał"))),
    ?assertEqual('абвгдеёжзийклмнопрстуфхцчшщъыьэюя',
                 (list_to_existing_atom("абвгдеёжзийклмнопрстуфхцчшщъыьэюя"))),
    % this atom was not created. So we get bad argument error                 
    ?assertError(badarg,list_to_existing_atom("tuesday")),
    ok.

list_to_tuple_examples() ->
    ?assertEqual({share, ['Ericsson_B', 163]},
                 (list_to_tuple([share, ['Ericsson_B', 163]]))),
    ok.

tuple_to_list_examples() ->
    ?assertEqual([share, {'Ericsson_B', 163}],
                 (tuple_to_list({share, {'Ericsson_B', 163}}))),
    ok.

float_examples() ->
    ?assertEqual(0.0, (float(0))),
    ?assertEqual(10.0, (float(10))),
    ?assertEqual(0.0, (float(0))),
    ?assertEqual(10.0, (float(10))),
    ?assertEqual("1.0", (sstr:float_to_list(1.0))),
    ?assertEqual("9.2234e+18",
                 (sstr:float_to_list(9223372036854775807.0))),
    ?assertEqual("-9.2234e+18",
                 (sstr:float_to_list(-9223372036854775808.0))),
    ?assertEqual("-3.40e+38",
                 (sstr:float_to_list(-3.4E+38))),
    ?assertEqual("-1.0e-01", (sstr:float_to_list(-1.0e-1))),
    ?assertEqual("-1.70e+308",
                 (sstr:float_to_list(-1.7E+308))),
    ?assertEqual("1.12", (sstr:float_to_list(1.123456, 2))),
    ?assertEqual(2.2017764,
                 (list_to_float("2.2017764e+0"))),
    ok.

integer_examples() ->
    ?assertEqual("1", (sstr:integer_to_list(1))),
    ?assertEqual("-1", (sstr:integer_to_list(-1))),
    ?assertEqual("1", (sstr:integer_to_list(+1))),
    ?assertError(badarg, (sstr:integer_to_list("1"))),
    ?assertEqual("1", (sstr:integer_to_list(1, 2))),
    ?assertEqual("1", (sstr:integer_to_list(1, 36))),
    ?assertError(badarg, (sstr:integer_to_list(1, 1))),
    ?assertError(badarg, (sstr:integer_to_list(1, 37))),
    ?assertEqual("10", (sstr:integer_to_list(36, 36))),
    ?assertEqual(123, (list_to_integer("123"))),
    ?assertEqual((-123), (list_to_integer("-123"))),
    ?assertEqual(123234982304982309482093833234234,
                 (list_to_integer("+123234982304982309482093833234234"))),
    ok.

round_examples() ->
    ?assertEqual(42, (round(42.1))),
    ?assertEqual(6, (round(5.5))),
    ?assertEqual((-6), (round(-5.5))),
    ok.

trunc_examples() ->
    ?assertEqual(5, (trunc(5.7))),
    ?assertEqual((-5), (trunc(-5.7))),
    ?assertEqual((-6), (round(-5.5))),
    ok.

float_problems() ->
    % check float limitation
    % http://erlang.org/doc/reference_manual/data_types.html#float_representation_problem
    ?assertEqual(36028797018963968,
                 (round(36028797018963969.0))),
    [?assertEqual(36028797018963968.0, (Value + 0.0))
     || Value
            <- lists:seq(36028797018963966, 36028797018963972)],
    [?assertEqual(36028797018963968, (round(Value + 0.0)))
     || Value
            <- lists:seq(36028797018963966, 36028797018963972)],
    ?assertEqual(36028797018963968,
                 (trunc(36028797018963969.0))),
    [?assertEqual(36028797018963968, (trunc(Value + 0.0)))
     || Value
            <- lists:seq(36028797018963966, 36028797018963972)],
    % ?debugFmt("~n~p~n",[0.1 + 0.3]),
    % https://floating-point-gui.de/
    ?assertEqual(0.30000000000000004, (0.1 + 0.2)),
    ?assertEqual(0.4, (0.1 + 0.3)),
    ?assertEqual(0.5, (0.1 + 0.4)),
    ok.

-endif.
