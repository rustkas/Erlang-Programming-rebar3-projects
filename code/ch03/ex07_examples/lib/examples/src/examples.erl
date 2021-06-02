-module(examples).

-export([even/1, number/1]).

-export([divide/1]).

even(Int) when Int rem 2 == 0 -> true;
even(Int) when Int rem 2 == 1 -> false.

number(Num) when is_integer(Num) -> integer;
number(Num) when is_float(Num) -> float;
number(_Other) -> false.

% Hidden check input data.
% If it is a number ruturn a number
divide(Int) when Int div 1 == Int -> Int.
