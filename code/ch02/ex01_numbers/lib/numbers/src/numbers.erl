-module(numbers).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Print big number - bignum", fun print_bignum/0},
     {"Integer list", fun integers_1/0},
     {"Based on ... 2..16", fun based_on/0},
     {"Compare numbers", fun compare_numbers/0},
     {"Check bad initialisation", fun bad_ini/0},
     {"Check float numbers", fun float_numbers/0},
     {"Check using matematical operators", fun mathimaticals_operators/0}
     ].

print_bignum() ->
    X = 1000000000 * 1000000000 * 1000000000 * 1000000000 *
            1000000000
            * 1000000000
            * 1000000000
            * 1000000000
            * 1000000000
            * 1000000000,
    ?debugFmt("bignum is ~n~p~n", [X]).

integers_1() ->
    [X1, X2, X3, X4] = [-234, 0, 10, 1000000000],
    ?assertEqual([-234, 0, 10, 1000000000],
                 [X1, X2, X3, X4]).

based_on() ->
    % numbers based on (2 to 16)
    ?debugFmt("2#1010 = ~p~n3#1010 = ~p~n4#1010 = ~p~n5#1010 "
              "= ~p~n6#1010 = ~p~n7#1010 = ~p~n8#1010 "
              "= ~p~n9#1010 = ~p~n10#1010 = ~p~n11#1010 "
              "= ~p~n12#1010 = ~p~n13#1010 = ~p~n14#1010 "
              "= ~p~n15#1010 = ~p~n16#1010 = ~p~n",
              [2#1010,
               3#1010,
               4#1010,
               5#1010,
               6#1010,
               7#1010,
               8#1010,
               9#1010,
               10#1010,
               11#1010,
               12#1010,
               13#1010,
               14#1010,
               15#1010,
               16#1010]).

compare_numbers() ->
    ?assertEqual(10, 2#1010),
    ?assertEqual((-174), (-16#AE)),
    ?assertEqual(97, $a),
    ?assertEqual(65, $A),
    ?assertEqual(10, $\n).

bad_ini() ->
    % note that syntax error is here
    % X = 5-,
    X = 5,
    Y = 5 - 4,
    ?debugFmt("X is ~p, Y is ~p~n", [X, Y]).

% Float use IEEE 754-1985 standard
float_numbers() ->
    ?assertEqual(17.368, 17.368),
    ?assertEqual((-56.654), (-56.654)),
    ?assertEqual(1.234e-10, 1.234E-10),
    ?assertEqual(0.0000000001234, 1.234e-10).

mathimaticals_operators() ->
    ?assertEqual(-1.0, -2 + 3/3),
    ?assertEqual(4, (-2+3)*4),
    ?assertEqual(10, -2 + 3 * 4),
    ?assertEqual(-14, -(2 + 3 * 4)),
    
    ?assertEqual(1, +1),
    ?assertEqual(-1, -1),
    ?assertEqual(1, 11 rem 5),
    ?assertEqual(3, (12 + 3) div 5),
    ?assertEqual(3.0, (12 + 3) / 5),
    ?assertEqual(12.56, 2*2*3.14),
    ?assertEqual(19, 1+2+3+5+8),
    ?assertEqual(-5, 2*2 + -3*3),
    Calculation = 1/2 + (2/3 + (3/4 + (4/5))) - 1,
    ?assertEqual(1.71667, list_to_float(io_lib:format("~.5f",[Calculation]))),
    ?assertError(badarith, 2.0 rem 3)
    .

-endif.
