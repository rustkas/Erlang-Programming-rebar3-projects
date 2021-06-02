-module(guards).

-export([factorial/1]).

-export([guard/2, guard2/2, guard3/2, guard4/2]).

% Defining factorial using a guard

factorial(N)
    when is_number(N) andalso
             not is_float(N) andalso N > 0 ->
    N * factorial(N - 1);
factorial(0) -> 1.

guard(X, Y)
    when not
             (((X > Y) or not is_atom(X)) and
                  (is_atom(Y) or (X == 3.4))) ->
    X + Y.

guard2(X, Y)
    when is_number(X) and is_number(Y) andalso
             Y >= X andalso X /= 3.4 ->
    Y - X.

guard3(X, Y)
    when is_number(X), is_number(Y); X =:= 1; X =:= 2 ->
    X + Y.

guard4(X, Y)
    when is_float(X), is_float(Y); X =:= 1.1; Y =:= 1.1 ->
    X + Y.
