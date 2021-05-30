-module(variables).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Init variables", fun init/0},
     {"Multiply an atom by a nuber",
      fun multiply_atom_by_number/0}].

init() ->
    A_long_variable_name = 1,
    Flag = true,
    Name2 = "Anatolii",
    DbgFlag = debug,
    [A_long_variable_name, Flag, Name2, DbgFlag],
    Double = 1,
    Double = Double * Double.

multiply_atom_by_number() ->
    Var = one,
    Double = 1,
    ?assertError(badarith,
                 (Double = Var * 2 ++ is_integer(Double))).
    % ?debugFmt("~n~p~n", [Double]).

    
-endif.
